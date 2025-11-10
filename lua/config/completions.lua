local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-x>'] = cmp.mapping.confirm({ select = true }),
  }),
  window = {
    completion = cmp.config.window.bordered(),        -- border around the suggestion list
    documentation = cmp.config.window.bordered(),     -- border around the documentation popup
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp'},
    { name = 'copilot', group_index = 2 },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        copilot = '[Copilot]',
        luasnip = '[Snippet]',
        buffer = '[Buffer]',
      })[entry.source.name]
      return vim_item
    end,
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
