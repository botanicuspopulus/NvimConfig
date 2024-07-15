return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary", -- It's working nicely on Neovim nightly
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = true,
			mappings = {
				close = {
					normal = "q", -- Close chat
					insert = "<C-c>",
				},
				reset = {
					normal = "<C-l>", -- Clear the chat buffer
					insert = "<C-l>",
				},
				complete = {
					detail = 'Use @<Tab> or /<Tab> for options.',
					insert = "<Tab>", -- Change to insert mode and press tab to get the completion
				},
				submit_prompt = {
					normal = "<CR>", -- Submit question to Copilot Chat
					insert = "<C-m>",
				},
				accept_diff = {
					normal = "<C-y>", -- Accept the diff
					insert = "<C-y>",
				},
				yank_diff = {
					normal = "gy",
				},
				show_diff = {
					normal = "gd", -- Show the diff
				},
				show_system_prompt = {
					normal = "gp",
				},
				show_user_selection = {
					normal = "gs",
				},

			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			local select = require("CopilotChat.select")
			-- Use unnamed register for the selection
			opts.selection = select.unnamed

			chat.setup(opts)
			require("CopilotChat.integrations.cmp").setup()

			vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
				chat.ask(args.args, { selection = select.visual })
			end, { nargs = "*", range = true })

			-- Inline chat with Copilot
			vim.api.nvim_create_user_command("CopilotChatInline", function(args)
				chat.ask(args.args, {
					selection = select.visual,
					window = {
						layout = "float",
						relative = "cursor",
						width = 1,
						height = 0.4,
						row = 1,
					},
				})
				end, { nargs = "*", range = true })

			-- Restore CopilotChatBuffer
			vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
				chat.ask(args.args, { selection = select.buffer })
			end, { nargs = "*", range = true })

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-*",
				callback = function()
					vim.opt_local.relativenumber = true
					vim.opt_local.number = true
					-- Get current filetype and set it to markdown if the current filetype is copilot-chat
					local ft = vim.bo.filetype
					if ft == "copilot-chat" then
						vim.bo.filetype = "markdown"
					end
				end,
			})
		end,
		window = {
			layout = 'float',
			width = 0.25,
			height = 0.9,
			border = 'rounded',
		},
		event = "VeryLazy",
		keys = {
			-- Show help actions with telescope
			{
				"<leader>cch",
				function()
					local actions =  require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.help_actions())
				end,
				desc = "CopilotChat - Help actions",
			},
			-- Show prompts actions with telescope
			{
				"<leader>ccp",
				function()
					local actions =  require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "CopilotChat - Prompt actions",
			},
			{
				"<leader>ccp",
				":lua require('CopilotChat.code_actions').show_prompt_actions({ selection = require('CopilotChat.select').visual })<CR>",
				mode = "x",
				desc = "CopilotChat - Prompt actions",
			},
			{
				"<leader>ccp",
				":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions())<CR>",
				mode = "x",
				desc = "CopilotChat - Prompt actions",
			},
			-- Code related commands
			{
				"<leader>cce",
				"<cmd>CopilotChatExplain<cr>",
				desc = "CopilotChat - Explain code"
			},
			{
				"<leader>cct", "<cmd>CopilotChatTests<cr>",
				desc = "CopilotChat - Generate tests"
			},
			{
				"<leader>ccr",
				"<cmd>CopilotChatReview<cr>",
				desc = "CopilotChat - Review code"
			},
			{
				"<leader>ccR",
				"<cmd>CopilotChatRefactor<cr>",
				desc = "CopilotChat - Refactor code"
			},
			{
				"<leader>ccn",
				"<cmd>CopilotChatBetterNamings<cr>",
				desc = "CopilotChat - Better Naming"
			},
			-- Chat with Copilot in visual mode
			{
				"<leader>ccv",
				":CopilotChatVisual",
				mode = "x",
				desc = "CopilotChat - Open in vertical split",
			},
			{
				"<leader>ccx",
				":CopilotChatInline<cr>",
				mode = "x",
				desc = "CopilotChat - Inline chat",
			},
			-- Custom input for CopilotChat
			{
				"<leader>cci",
				function()
					local input = vim.fn.input("Ask Copilot: ")
					if input ~= "" then
						vim.cmd("CopilotChat " .. input)
					end
				end,
				desc = "CopilotChat - Ask input",
			},
			-- Generate commit message based on the git diff
			{
				"<leader>ccm",
				"<cmd>CopilotChatCommit<cr>",
				desc = "CopilotChat - Generate commit message for all changes",
			},
			{
				"<leader>ccM",
				"<cmd>CopilotChatCommitStaged<cr>",
				desc = "CopilotChat - Generate commit message for staged changes",
			},
			-- Quick chat with Copilot
			{
				"<leader>ccq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						vim.cmd("CopilotChatBuffer " .. input)
					end
				end,
				desc = "CopilotChat - Quick chat",
			},
			-- Debug
			{
				"<leader>ccd",
				"<cmd>CopilotChatDebugInfo<cr>",
				desc = "CopilotChat - Debug Info"
			},
			-- Fix the issue with diagnostic
			{
				"<leader>ccf",
				"<cmd>CopilotChatFixDiagnostic<cr>",
				desc = "CopilotChat - Fix Diagnostic"
			},
			-- Clear buffer and chat history
			{
				"<leader>ccl",
				"<cmd>CopilotChatReset<cr>",
				desc = "CopilotChat - Clear buffer and chat history" },
			-- Toggle Copilot Chat Vsplit
			{
				"<leader>ccv",
				"<cmd>CopilotChatToggle<cr>",
				desc = "CopilotChat - Toggle Vsplit" },
		},
	},
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				auto_trigger = true,
				debounce = 15,
				keymap = {
					accept = "<C-e>",
					dismiss = "<C-S-e>",
					accept_word = "<C-f>",
					accept_line = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
				},
			},
		},
	}
}
