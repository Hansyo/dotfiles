function tab_expand(all_ignore, direction)
	if vim.fn["pum#visible"]() then
		vim.fn["pum#map#insert_relative"](direction)
	elseif vim.fn["vsnip#expandable"]() then
		if vim.fn["vsnip#jumpable"](direction) then
			if direction > 0 then
				return "<Plug>(vsnip-jump-next)"
			else
				return "<Plug>(vsnip-jump-prev)"
			end
		end
		return all_ignore
	else
		local _col = vim.fn.col(".")
		if _col <= 1 then
			return all_ignore
		end
		local regex = vim.regex([[\s]])
		local from_idx, to_idx = regex:match_str(vim.fn.getline(".")[_col - 2])
		if from_idx == nil or to_idx == nil then
			return all_ignore
		end
		vim.fn["ddc#map#manual_complete"]()
	end
end

return {
	{
		"<CR>",
		function()
			if vim.fn["pum#visible"]() then
				vim.fn["pum#map#confirm"]()
			else
				return "<CR>"
			end
		end,
		mode = { "i" },
		expr = true,
	},
	{
		"<Tab>",
		function() return tab_expand("<Tab>", 1) end,
		mode = { "i", "s" },
		-- expr = true,
	},
	{
		"<S-Tab>",
		function() return tab_expand("<S-Tab>", -1) end,
		mode = { "i", "s" },
	},
	{
		"<C-n>",
		function()
			vim.fn["pum#map#select_relative"](1)
		end,
		mode = { "i" },
	},
	{
		"<C-p>",
		function()
			vim.fn["pum#map#select_relative"](-1)
		end,
		mode = { "i" },
	},
	{
		"<C-y>",
		function()
			vim.fn["pum#map#confirm"]()
		end,
		mode = { "i" },
	},
	{
		"<C-e>",
		function()
			vim.fn["pum#map#cancel"]()
		end,
		mode = { "i" },
	},
}
