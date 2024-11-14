-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { 'williamboman/mason.nvim' },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { 'williamboman/mason-lspconfig.nvim' },

    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim',                opts = {} },
    { "nvimtools/none-ls.nvim", }

  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local null_ls = require("null-ls")
    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
    end

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        'lua_ls',
        'ruff',
        'basedpyright',
        'lemminx',
        'marksman',
        'quick_lint_js',
      }
    })
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.prettier,
      },
    })

    require('mason-lspconfig').setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      end
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
      settings = {
        capabilities = lsp_capabilities,
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
            maxPreload = 100000,
            preLoadFileSize = 10000,
          },
          telemetry = { enable = false },
        },
      },
    }

    lspconfig.ruff.setup {}
    lspconfig.basedpyright.setup {
      capabilities = lsp_capabilities,
      settings = {
        basedpyright = {
          typeCheckingMode = "basic",
        },
      },
    }
  end

}
