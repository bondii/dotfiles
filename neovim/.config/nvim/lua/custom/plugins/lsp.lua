-- lua/custom/plugins/lsp.lua
return {
  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim', dependencies = { 'neovim/nvim-lspconfig' }, opts = {} },
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
  -- Minimal LSP bootstrap (ex: lua_ls + tsserver)
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup { capabilities = capabilities }
      lspconfig.ts_ls.setup { capabilities = capabilities }
      -- lägg fler servers efter behov
    end,
  },
}
