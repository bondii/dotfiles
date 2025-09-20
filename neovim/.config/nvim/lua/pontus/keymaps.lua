-- lua/pontus/keymaps.lua
vim.g.mapleader = ' '

vim.g.maplocalleader = ' '

local map = vim.keymap.set
local silent = { silent = true, noremap = true }

----------------------------------------------------
-- ~~ These are set in ~/.config/vim/shared-maps.vim ~~ --

--map('i', 'jk', '<Esc>', { noremap = true })
--map('n', '<Tab>', ':bnext<CR>', silent)
--map('n', '<S-Tab>', ':bprevious<CR>', silent)
--map('n', '<leader>T', ':enew<CR>', silent)
--map('n', '<leader>bq', ':bp | bd #<CR>', silent)
--map('n', '<leader>bl', ':ls<CR>')
--map('n', '<leader><space>', ':nohlsearch<Bar>:echo<CR>', silent)
--map('n', '00', '^')

-- ~~ END Set in ~/.config/vim/shared-maps.vim ~~ --
----------------------------------------------------

-- Yank to system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', vim.tbl_extend('force', silent, { desc = 'Yank → clipboard' }))
map('n', '<leader>Y', '"+Y', vim.tbl_extend('force', silent, { desc = 'Yank line → clipboard' }))
-- Paste from system clipboard
map({ 'n', 'v' }, '<leader>p', '"+p', vim.tbl_extend('force', silent, { desc = 'Paste ← clipboard' }))
map('n', '<leader>P', '"+P', vim.tbl_extend('force', silent, { desc = 'Paste before ← clipboard' }))

-- Quick save
map('n', '<leader>w', ':w<CR>', silent)

-- Add new row without insert
map('n', 't', 'o<Esc>k', silent)
map('n', 'T', 'O<Esc>j', silent)

map('n', '<leader>e', ':Neotree toggle<CR>', vim.tbl_extend('force', silent, { desc = 'Filetree' }))

-- Reload config (F2)
map('n', '<F2>', function()
  vim.cmd 'source $MYVIMRC'
end, silent)

-- Load common Vim mappings
local shared = vim.fn.expand '~/.config/vim/shared-maps.vim'
if vim.fn.filereadable(shared) == 1 then
  vim.cmd.source(shared)
end
