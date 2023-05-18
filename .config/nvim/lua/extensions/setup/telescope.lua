return function()
	local function tele_builtin(name, opt)
		return function()
			return require("telescope.builtin")[name](opt or {})
		end
	end

	local function tele_ext(name, prop, opt)
		return function()
			local telescope = require("telescope")
			telescope.load_extension(name)
			return telescope.extensions.config.name[prop](opt or {})
		end
	end

	local set = vim.keymap.set
	set("n", "<leader>f", "<Plug>(TelescopeLeader)")
	set("n", "<Plug>(TelescopeLeader)j", tele_builtin("current_buffer_fuzzy_find", {}))
	set("n", "<Plug>(TelescopeLeader)f", tele_builtin("find_files", {}))
	set("n", "<Plug>(TelescopeLeader)F", tele_builtin("find_files", { hidden = true }))
	set("n", "<Plug>(TelescopeLeader)g", tele_builtin("live_grep", {})) -- This will need ripgrep
	set("n", "<Plug>(TelescopeLeader)b", tele_builtin("buffers", {}))
	set("n", "<Plug>(TelescopeLeader)h", tele_builtin("help_tags", {}))
end
