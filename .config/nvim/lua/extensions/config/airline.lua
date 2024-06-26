return function()
	vim.g.airline_powerline_fonts = true
	local a_sym = {
		branch = "",
		colnr = " ℅",
		crypt = "🔒",
		dirty = "⚡",
		ellipsis = "...",
		keymap = "Keymap:",
		linenr = " ",
		maxlinenr = " ",
		modified = "+",
		notexists = "Ɇ",
		paste = "PASTE",
		readonly = "",
		space = " ",
		spell = "SPELL",
		whitespace = "☲",
	}
	vim.g.airline_symbols = a_sym
end
