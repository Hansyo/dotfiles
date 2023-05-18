return function()
	local function tele_builtin(name)
		return function(opt)
			return function()
				return require("telescope.builtin")[name](opt or {})
			end
		end
	end

	local function tele_ext(name, prop)
		return function(opt)
			return function()
				local telescope = require("telescope")
				telescope.load_extension(name)
				return telescope.extensions.config.name[prop](opt or {})
			end
		end
	end

	local set = vim.keymap.set
	set("n", "<leader>jj", tele_builtin("current_buffer_fuzzy_find")({}))
	set("n", "<leader>ff", tele_builtin("find_files")({}))
	set("n", "<leader>FF", tele_builtin("find_files")({ hidden = true }))
	set("n", "<leader>fg", tele_builtin("live_grep")({})) -- This will need ripgrep
	set("n", "<leader>fb", tele_builtin("buffers")({}))
	set("n", "<leader>fh", tele_builtin("help_tags")({}))
end
