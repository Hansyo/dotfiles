return function()
	local set = vim.keymap.set
	set("n", "<C-a>", "<Plug>(dial-increment)")
	set("n", "g<C-a>", "g<Plug>(dial-increment)")
	set("v", "<C-a>", "<Plug>(dial-increment)")
	set("v", "g<C-a>", "g<Plug>(dial-increment)")
	set("n", "<C-x>", "<Plug>(dial-decrement)")
	set("n", "g<C-x>", "g<Plug>(dial-decrement)")
	set("v", "<C-x>", "<Plug>(dial-decrement)")
	set("v", "g<C-x>", "g<Plug>(dial-decrement)")
end
