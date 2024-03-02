vim.api.nvim_create_user_command("ReplacePuctuation", function()
	vim.cmd(":%s/。/．/ge")
	vim.cmd(":%s/、/，/ge")
end, {
	nargs = 0,
})
