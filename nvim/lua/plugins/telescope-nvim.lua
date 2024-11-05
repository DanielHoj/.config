-- Fuzzy finder
return {
  -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',
  lazy = true,
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    { 'nvim-lua/plenary.nvim' },
    {
      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    {
      'debugloop/telescope-undo.nvim'
    }
  },

  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          vertical = {
            width = 0.75
          }
        },
        path_display = {
          filename_first = {
            reverse_directories = true
          }
        },
      },
      extensions = {
        undo = {
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        },
      },
    })

    -- Enable telescope fzf native, if installed
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("undo")
    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
  end,
}
