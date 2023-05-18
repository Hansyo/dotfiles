return function()
	vim.keymap.set({ "n", "i", "v" }, "<Plug>(ToggleHotkey)T", "<Plug>(TwilightToggle)")
	vim.keymap.set({ "n", "i", "v" }, "<Plug>(TwilightToggle)", "<cmd>Twilight<CR>")
end
