-- lua/custom/plugins/lsp.lua
return {
  { 'mason-org/mason.nvim', opts = {} },

  -- Mason <-> LSP + auto-enable of installed servers
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {
      -- Install automatically
      ensure_installed = { 'lua_ls', 'ts_ls' },
      -- automatic_enable = true is default: mason-lspconfig runs vim.lsp.enable()
    },
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete(),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'luasnip' },
        },
      }
    end,
  },

  -- Nvim LSP: definie config via vim.lsp.config (not lspconfig.setup)
  {
    'neovim/nvim-lspconfig',
    config = function()
      local caps = require('cmp_nvim_lsp').default_capabilities()

      -- 1) Set *default* for all LSP-clients
      vim.lsp.config('*', {
        capabilities = caps,
      })

      -- 2) Per-server config (exempel: lua_ls)
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      -- OBS: Don't call vim.lsp.enable() here if you let mason-lspconfig
      -- auto-enable, or you risk double-clients.
    end,
  },
}
