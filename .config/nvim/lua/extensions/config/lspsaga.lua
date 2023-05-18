return function()
	require("lspsaga").setup({
      code_action = {
        num_shortcut = true,
        show_server_name = false,
        extend_gitsigns = true,
        keys = {
          -- string | table type
          quit = {"q", "<ESC>"},
          exec = "<CR>",
        },
      },
	})
end
