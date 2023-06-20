return function()
	vim.fn["skkeleton#config"]({
		globalJisyo = "~/.skk/SKK-JISYO.L",
		userJisyo = "~/.skk/USER-JISYO",
		eggLikeNewline = true, -- 変換モードで改行したときに、確定だけ行う(改行しない)
	})
end
