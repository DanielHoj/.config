-- Auto-completion / Snippets
return {
  -- https://github.com/hrsh7th/nvim-cmp
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet engine & associated nvim-cmp source
    -- https://github.com/L3MON4D3/LuaSnip
    'L3MON4D3/LuaSnip',
    -- https://github.com/saadparwaiz1/cmp_luasnip
    'saadparwaiz1/cmp_luasnip',

    -- LSP completion capabilities
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    'hrsh7th/cmp-nvim-lsp',

    -- Additional user-friendly snippets
    -- https://github.com/rafamadriz/friendly-snippets
    'rafamadriz/friendly-snippets',
    -- https://github.com/hrsh7th/cmp-buffer
    'hrsh7th/cmp-buffer',
    -- https://github.com/hrsh7th/cmp-path
    'hrsh7th/cmp-path',
    -- https://github.com/hrsh7th/cmp-cmdline
    'hrsh7th/cmp-cmdline',
    -- https://github.com/lukas-reineke/cmp-under-comparator
    'lukas-reineke/cmp-under-comparator',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    local mapping = {
      ['<C-j>'] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
      ['<C-k>'] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
      ['<C-h>'] = { c = cmp.mapping.abort() },
      ['<C-l>'] = {
        c = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      }
    }

    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup({
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sorting = {
        priority_weight = 1,
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          require("cmp-under-comparator").under,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },

      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-Space>'] = cmp.mapping.complete {},    -- show completion suggestions
        ['<C-h>'] = cmp.mapping.abort(),
        ['<C-l>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },

        -- Tab through suggestions or when a snippet is active, tab to the next argument
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<C-S>'] = cmp.mapping(function()
          cmp.complete({
            config = {
              sources = {
                { name = 'luasnip' }
              }
            }
          })
        end, { 'i', 's' }),

      },

      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" },  -- snippets
        -- { name = "buffer" },   -- text within current buffer
        -- { name = "path" },     -- file system paths
      }),

      window = {
        -- Add borders to completions popups
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = mapping,
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = mapping,
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })
  end,
}
