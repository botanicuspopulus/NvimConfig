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
			mappings = {
				submit_prompt = {
					normal = "<CR>", -- Submit question to Copilot Chat
					insert = "<C-m>",
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
			{
				"<leader>ccp",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end
				end,
				desc = "CopilotChat - Quick Chat",
			},
			{
				"<leader>cch",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(action.help_actions())
				end,
				desc = "CopilotChat - Help Actions",
			},
			{
				"<leader>ccp",
				function()
					local actions = require("CopilotChat.acions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "CopilotChat - Prompt Actions",
			},
			{
				"<leader>cc|",
				"<cmd>CopilotChatVsplitToggle<CR>",
				desc = "CopilotChat - Toggle Vsplit",
			},
			{
				"<leader>ccv",
				":CopilotChatVisual",
				mode = "x",
				desc = "CopilotChat - Open in vertical split"
			},
			{
				"<leader>ccc",
				":CopilotChatInPlace<CR>",
				mode = { "n", "x" },
				desc = "CopilotChat - Run in-place code",
			},
			{
				"<leader>ccf",
				"<cmd>CopilotChatFixDiagnostic<CR>",
				desc = "CopilotChat - Fix diagnostic",
			}
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
