return function()
	require("notify").setup({
		background_colour = "#000000",
		render = "compact",
	})
	require("telescope").load_extension("notify")
end
