local TeleLeader = "<Plug>(TeleLeader)"
local wrap = function(cmd)
	return "<Cmd>Telescope " .. cmd .. "<CR>"
end
return {
	"nvim-telescope/telescope.nvim",
	event = { "VeryLazy" },
	cmd = { "Telescope" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"rcarriga/nvim-notify",
	},
	keys = {
		{ "<Leader>f", TeleLeader },
		{ TeleLeader .. "j", wrap("current_buffer_fuzzy_find") },
		{ TeleLeader .. "f", wrap("find_files") },
		{ TeleLeader .. "F", wrap("find_files hidden=true") },
		{ TeleLeader .. "g", wrap("live_grep") }, -- This will need ripgrep
		{ TeleLeader .. "b", wrap("buffers") },
		{ TeleLeader .. "h", wrap("help_tags") },
	},
	opts = {
		defaults = {
			-- Default configuration for telescope goes here:
			-- config_key = value,
			mappings = {
				i = {
					-- map actions.which_key to <C-h> (default: <C-/>)
					-- actions.which_key shows the mappings for your picker,
					-- e.g. git_{create, delete, ...}_branch for the git_branches picker
					["<C-/>"] = "which_key",
				},
			},
		},
		pickers = {
			-- Default configuration for builtin pickers goes here:
			-- picker_name = {
			--   picker_config_key = value,
			--   ...
			-- }
			-- Now the picker_config_key will be applied every time you call this
			-- builtin picker
		},
		extensions = {
			-- Your extension configuration goes here:
			-- extension_name = {
			--   extension_config_key = value,
			-- }
			-- please take a look at the readme of the extension you want to configure
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
	},
}
