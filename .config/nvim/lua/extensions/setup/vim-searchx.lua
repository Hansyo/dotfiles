return function()
	local set = vim.keymap.set
	local noremap = { noremap = true }
	-- Overlap default search
	set("n", "?", "<Cmd>call searchx#start({ 'dir': 0 })<CR>", noremap)
	set("n", "/", "<Cmd>call searchx#start({ 'dir': 1 })<CR>", noremap)
	set("x", "?", "<Cmd>call searchx#start({ 'dir': 0 })<CR>", noremap)
	set("x", "/", "<Cmd>call searchx#start({ 'dir': 1 })<CR>", noremap)
	set("c", ";", "<Cmd>call searchx#select()<CR>", noremap)
	-- Overlap default match-move
	set("n", "n", "<Cmd>call searchx#next_dir()<CR>", noremap)
	set("n", "N", "<Cmd>call searchx#prev_dir()<CR>", noremap)
	set("x", "n", "<Cmd>call searchx#next_dir()<CR>", noremap)
	set("x", "N", "<Cmd>call searchx#prev_dir()<CR>", noremap)
end
