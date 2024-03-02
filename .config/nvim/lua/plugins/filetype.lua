return {
	"nathom/filetype.nvim",
	enabled = false, -- Because it's not maintained
	init = function ()
		vim.g.did_load_filetypes = 1
	end,
}
