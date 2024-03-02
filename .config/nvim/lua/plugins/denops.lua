return {
	"vim-denops/denops.vim",
	event = "VeryLazy",
	dependencies = {
		"vim-denops/denops-shared-server.vim",
	},
	init = function()
		vim.g.denops_server_addr = "127.0.0.1:32123"
		vim.g["denops#debug"] = 1
		-- setting DenopsInstallSharedServer command
		vim.api.nvim_create_user_command("DenopsInstallSharedServer", "call denops_shared_server#install()", {})
	end,
}
