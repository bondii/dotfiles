-- lua/custom/plugins/ui.lua
return {
  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = { options = { theme = 'auto', icons_enabled = true } },
  },

  -- Filträd (välj en)
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    cmd = 'Neotree',
  },
  -- eller:
  -- { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, cmd = "NvimTreeToggle" },

  -- Tema: Tokyonight (eller byt till catppuccin)
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
