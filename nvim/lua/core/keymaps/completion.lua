-- CMP select mode fix
vim.keymap.set("s", "c", function()
  vim.api.nvim_feedkeys("c", "n", false)
end, { silent = true, remap = false, desc = "Don't paste in select mode" })
vim.keymap.set("s", "p", function()
  vim.api.nvim_feedkeys("p", "n", false)
end, { silent = true, remap = false, desc = "Don't paste in select mode" })
