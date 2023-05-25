local TeleLeader = "<Plug>(TeleLeader)"
local wrap = function(cmd)
	return "<Cmd>Telescope " .. cmd .. "<CR>"
end

return {
	{ "<Leader>f",       TeleLeader },
	{ TeleLeader .. "j", wrap("current_buffer_fuzzy_find"), },
	{ TeleLeader .. "f", wrap("find_files"), },
	{ TeleLeader .. "F", wrap("find_files hidden=true"), },
	{ TeleLeader .. "g", wrap("live_grep"), }, -- This will need ripgrep
	{ TeleLeader .. "b", wrap("buffers"), },
	{ TeleLeader .. "h", wrap("help_tags"), },
}
