return { -- Autocompletion
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'folke/lazydev.nvim',
  },

  opts = {
    keymap = {
      preset = 'default',
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev', 'easy-dotnet' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        ['easy-dotnet'] = {
          name = 'easy-dotnet',
          enabled = true,
          module = 'easy-dotnet.completion.blink',
          score_offset = 10000,
          async = true,
        },
      },
    },

    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  },
}
