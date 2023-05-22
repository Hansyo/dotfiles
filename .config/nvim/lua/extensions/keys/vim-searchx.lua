return {
	{ "?", "<Cmd>call searchx#start({ 'dir': 0 })<CR>", mode = {"n", "x"} },
	{ "/", "<Cmd>call searchx#start({ 'dir': 1 })<CR>", mode = {"n", "x"} },
	{ ";", "<Cmd>call searchx#select()<CR>", mode = "c" },
	-- Overlap default match-move
	{ "n", "<Cmd>call searchx#next_dir()<CR>", mode = {"n", "x"} },
	{ "N", "<Cmd>call searchx#prev_dir()<CR>", mode = {"n", "x"} },
}
