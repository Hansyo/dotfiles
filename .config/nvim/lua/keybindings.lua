-- Leader
vim.g.leader = " "
vim.g.mapleader = " "

-- Other key
local set = vim.keymap.set
local silent = { silent = true }
local noremap = { noremap = true }

-- General

set("n", "<f1>", "<Nop>") -- unbind help key
set("n", "<Leader>s", "<Plug>(ToggleHotkey)")
-- set('n', 't', '<C-w>')
set("n", "<Leader>qq", "<cmd>nohlsearch<CR>")
set("n", "<Plug>(ToggleHotkey)n", function() vim.opt_local.relativenumber = not (vim.opt_local.relativenumber:get()) end)
set("n", "<Plug>(ToggleHotkey)o", function() vim.o.scrolloff = (vim.o.scrolloff == 0) and 999 or 0 end)
set("i", "jj", "<ESC>", silent)
set("n", "+", "%")

-- Add dot-repeat to mark key
set("n", "m", ".", noremap)

-- Toggle QuickFIX
set("n", "<Plug>(ToggleHotkey)s",
	function()
		local nr = vim.fn.winnr()
		vim.cmd([[cwindow]])
		local nr2 = vim.fn.winnr()
		if nr == nr2 then
			vim.cmd([[cclose]])
		end
	end
)

-- LSP -> extensions/setup/lspsaga.lua
-- set("n", "<Leader>n", vim.diagnostic.goto_next)
-- set("n", "<Leader>N", vim.diagnostic.goto_prev)
-- set("n", "<Leader>i", vim.lsp.buf.hover)
-- set("n", "<Leader>I", vim.lsp.buf.definition)
-- set("n", "<Leader>a", vim.lsp.buf.code_action)
-- set("n", "<F2>", vim.lsp.buf.rename)
-- set("n", "<F5>", vim.lsp.buf.format)
--[[
-- default keybindings
set("n", "<C-m>", vim.lsp.buf.signature_help)
set("n", "gy", vim.lsp.buf.type_definition)
set("n", "gr", vim.lsp.buf.references)
set("n", "<space>e", vim.lsp.diagnostic.show_line_diagnostics)
--]]
