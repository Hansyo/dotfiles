-- Leader
vim.g.leader = ' '
vim.g.mapleader = ' '

-- Other key
local set = vim.keymap.set
local silent = {silent = true}

-- General
set('n', 't', '<C-w>')
set('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>', silent)
set('n', '<F3>', function() vim.opt_local.relativenumber = not(vim.opt_local.relativenumber:get()) end)
set('i', 'jj', '<ESC>', silent)

-- LSP
set('n', '<Leader>n', '<cmd>lua vim.diagnostic.goto_next()<CR>')
set('n', '<Leader>p', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
set('n', '<Leader>i', '<cmd>lua vim.lsp.buf.hover()<CR>')
set('n', '<Leader>I', '<cmd>lua vim.lsp.buf.definition()<CR>')
set('n', '<Leader><Space>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>')
set('n', '<F5>', '<cmd>lua vim.lsp.buf.format()<CR>')
--[[
-- default keybindings
set("n", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
set("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
set("n", "ma", "<cmd>lua vim.lsp.buf.code_action()<CR>")
set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
--]]
