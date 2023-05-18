return function()
	local set = vim.keymap.set
	set("n", "<Leader>n", "<cmd>Lspsaga diagnostic_jump_next<CR>")
	set("n", "<Leader>N", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
	set("n", "<Leader>i", "<cmd>Lspsaga hover_doc<CR>")
	set("n", "<Leader>I", "<cmd>Lspsaga goto_definition<CR>")
	set("n", "<Leader>o", "<cmd>Lspsaga lsp_finder<CR>")
	set("n", "<Leader>a", "<cmd>Lspsaga code_action<CR>")
	set("n", "<F2>", "<cmd>Lspsaga rename<CR>")
	set("n", "<F5>", vim.lsp.buf.format)
end
