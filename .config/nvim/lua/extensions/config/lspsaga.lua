return function()
	require("lspsaga").setup({
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
	})
end
