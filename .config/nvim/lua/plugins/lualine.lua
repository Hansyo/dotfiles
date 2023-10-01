local colors = {
	-- StatusLine background color.
	background = "#2c3043",
	-- Mode colors.
	normal = "#82aaff",
	insert = "#21c7a8",
	visual = "#ae81ff",
	command = "#ecc48d",
	replace = "#ff5874",
	-- Mode text color.
	text = "#092236",
	-- StatusLineNC foreground.
	color7 = "#a1aab8",
	-- Normal text color.
	n_text = "#c3ccdc",
}
local bg_mode_color = {
	n = colors.normal,
	i = colors.insert,
	v = colors.visual,
	[""] = colors.visual,
	V = colors.visual,
	c = colors.command,
	no = colors.normal,
	s = colors.visual,
	S = colors.visual,
	[""] = colors.visual,
	ic = colors.insert,
	R = colors.replace,
	Rv = colors.replace,
	cv = colors.command,
	ce = colors.command,
	r = colors.command,
	rm = colors.command,
	["r?"] = colors.command,
	["!"] = colors.command,
	t = colors.command,
}
local mode_string = {
	n = "N",
	i = "I",
	v = "V",
	[""] = "V",
	V = "V",
	c = "C",
	no = "N",
	s = "V",
	S = "V",
	[""] = "V",
	ic = "I",
	R = "R",
	Rv = "R",
	cv = "C",
	ce = "C",
	r = "C",
	rm = "C",
	["r?"] = "C",
	["!"] = "C",
	t = "C",
}
return {
	"nvim-lualine/lualine.nvim",
	event = { "VeryLazy" },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
	enabled = function()
		return not vim.g.vscode
	end,
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = {
				{
					function()
						return mode_string[vim.fn.mode()]
					end,
					color = function()
						return { bg = bg_mode_color[vim.fn.mode()] }
					end,
				},
			},
			lualine_b = {
				{ "b:gitsigns_head", icon = "" },
				"b:gitsigns_status",
				{ "diagnostics" },
			},
			lualine_c = {
				{
					"filename",
					path = 3,
					file_status = true,
					shorting_target = 40,
					symbols = {
						modified = "[+]", -- Text to show when the file is modified.
						readonly = "[RO]", -- Text to show when the file is non-modifiable or readonly.
						unnamed = "[No Name]", -- Text to show for unnamed buffers.
						newfile = "[New]", -- Text to show for newly created file before first write
					},
				},
			},
			lualine_x = { "searchcount" },
			lualine_y = { "encoding", "filetype" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
