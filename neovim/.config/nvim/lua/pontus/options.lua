-- lua/pontus/options.lua
-- Allmänna inställningar (port av din general.vim)
local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn

-- --- UI ---
opt.termguicolors = true
opt.cursorline = true
opt.colorcolumn = '80'
opt.number = true
opt.relativenumber = true

-- Highlight-sökning
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Indentering
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 4
opt.softtabstop = -1
opt.shiftwidth = 0
opt.shiftround = true
opt.autoindent = true

-- Splits
-- opt.splitbelow = true
-- opt.splitright = true

-- Stavning (av/på vid behov)
-- opt.spell = true
-- vim.opt.spelllang = { "en_us", "sv" }

-- Backup/undo/swap i Neovims state-kataloger (bättre än ~/.vim/tmp)
opt.undofile = true
local undodir = fn.stdpath 'state' .. '/undo'
if fn.isdirectory(undodir) == 0 then
  fn.mkdir(undodir, 'p')
end
opt.undodir = undodir

-- Swap/backup-kataloger (valfritt)
local swapdir = fn.stdpath 'state' .. '/swap'
if fn.isdirectory(swapdir) == 0 then
  fn.mkdir(swapdir, 'p')
end
opt.directory = swapdir

-- Misc
opt.mouse:append 'a'
opt.scrolloff = 5
opt.lazyredraw = true -- harmless i NeoVim
-- opt.clipboard = "unnamedplus"

-- Återgå till senaste position i filen
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Textfiler: wrap/linebreak
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'text', 'markdown', 'gitcommit' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.list = false
  end,
})

-- Transparent bakgrund (om du vill, som i din vimrc)
-- cmd([[hi Normal guibg=NONE ctermbg=NONE]])
