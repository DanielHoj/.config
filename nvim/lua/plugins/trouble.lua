return{
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>td",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
     "<leader>ts",
      "<cmd>Trouble symbols toggle focus=true<cr>",
      desc = "Symbols (Trouble)",
    },
   {
      "<leader>tl",
      "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
     desc = "LSP Definitions / references / ... (Trouble)",
    },
  },
}
