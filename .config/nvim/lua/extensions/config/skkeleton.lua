return function()
	vim.fn["skkeleton#config"]({
		globalDictionaries = { "~/.skk/SKK-JISYO.L", },
		userJisyo = "~/.skk/USER-JISYO",
	})
end
