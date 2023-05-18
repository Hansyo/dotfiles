return function()
	vim.g.qs_highlight_on_keys = { "f", "F", "t", "T", }
	vim.keymap.set("n", "<Plug>(ToggleHotkey)q", "<plug>(QuickScopeToggle)")
end
