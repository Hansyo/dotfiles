return {
	{ "]t", "<Cmd>lua require('todo-comments').jump_next()<CR>", mode = { "n" }, desc = "Next todo comment" },
	{ "[t", "<Cmd>lua require('todo-comments').jump_prev()<CR>", mode = { "n" }, desc = "Previous todo comment" },
}
