local function todo(name)
	return function(opt)
		return function()
			return require("todo-comments")[name](opt or {})
		end
	end
end
return {
	{ "]t", todo("jump_next"), desc = "Next todo comment" },
	{ "[t", todo("jump_prev"), desc = "Previous todo comment" },
}
