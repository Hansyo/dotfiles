-- Leader
vim.g.leader = ' '
vim.g.mapleader = ' '

-- Other key
local set = vim.keymap.set
local silent = {silent = true}
local noremap = {noremap = true}

-- General
-- set('n', 't', '<C-w>')
set('n', 'qq', '<cmd>nohlsearch<CR>', silent)
set('n', '<F3>', function() vim.opt_local.relativenumber = not(vim.opt_local.relativenumber:get()) end)
set('n', '<F6>', function() vim.o.scrolloff = (vim.o.scrolloff == 0) and 999 or 0 end)
set('i', 'jj', '<ESC>', silent)

-- LSP -> lspkind setup
-- set('n', '<Leader>n', vim.diagnostic.goto_next)
-- set('n', '<Leader>N', vim.diagnostic.goto_prev)
-- set('n', '<Leader>i', vim.lsp.buf.hover)
-- set('n', '<Leader>I', vim.lsp.buf.definition)
-- set('n', '<Leader>a', vim.lsp.buf.code_action)
-- set('n', '<F2>', vim.lsp.buf.rename)
-- set('n', '<F5>', vim.lsp.buf.format)
--[[
-- default keybindings
set('n', '<C-m>', vim.lsp.buf.signature_help)
set('n', 'gy', vim.lsp.buf.type_definition)
set('n', 'gr', vim.lsp.buf.references)
set('n', '<space>e', vim.lsp.diagnostic.show_line_diagnostics)
--]]

