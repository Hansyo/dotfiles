return function()
	local autocmd = vim.api.nvim_create_autocmd
	local vim_vsnip_user = vim.api.nvim_create_augroup("VimVsnipUser", { clear = true })
	autocmd("User", {
		pattern = "PumCompleteDone",
		group = vim_vsnip_user,
		command = "call vsnip_integ#on_complete_done(g:pum#completed_item)",
	})
end
