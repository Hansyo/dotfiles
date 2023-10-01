return {
	"nvimdev/lspsaga.nvim",
	event = { "LspAttach" },
	keys = {
		{ "<Leader>n", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump next LSP diagnostic" },
		{ "<Leader>N", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump prev LSP diagnostic" },
		{ "<Leader>i", "<cmd>Lspsaga hover_doc<CR>", desc = "Show cursor document" },
		{ "<Leader>I", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto Definition" },
		{ "<Leader>o", "<cmd>Lspsaga lsp_finder<CR>", desc = "Show Definition and References" },
		{ "<Leader>a", "<cmd>Lspsaga code_action<CR>" },
		{ "<F2>", "<cmd>Lspsaga rename<CR>", desc = "Rename object" },
		{ "<F5>", vim.lsp.buf.format, desc = "Format on LSP" },
	},
	enabled = function()
		return not vim.g.vscode
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		lightbulb = {
			enable = false,
		},
		code_action = {
			num_shortcut = true,
			show_server_name = false,
			extend_gitsigns = true,
			keys = {
				-- string | table type
				quit = { "q", "<ESC>" },
				exec = "<CR>",
			},
		},
		rename = {
			in_select = false,
		},
	},
}
