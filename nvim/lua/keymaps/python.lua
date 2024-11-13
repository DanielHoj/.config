local keymap = vim.keymap

-- Jupyter notebook, with molten.nvim
keymap.set("n", "<leader>mi", ":MoltenInit<CR>")
keymap.set("v", "<leader>mr", ":<C-u>MoltenEvaluateVisual<CR>gv")
keymap.set("n", "<leader>mr", ":MoltenEvaluateLine<CR>")
keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>")
keymap.set("n", "<leader>ms", ":noautocmd MoltenEnterOutput<CR>")

-- REPL
keymap.set("n", "<leader>cr", function() require('nvim-python-repl').send_statement_definition() end)
keymap.set("v", "<leader>cr", function() require('nvim-python-repl').send_visual_to_repl() end)
keymap.set("n", "<leader>cb", function() require('nvim-python-repl').send_buffer_to_repl() end)
keymap.set("n", "<leader>ct", function() require('nvim-python-repl').toggle_execute() end)
keymap.set("n", "<leader>ch", function() require('nvim-python-repl').toggle_vertical() end)
keymap.set("n", "<leader>cw", function() require('nvim-python-repl').open_repl() end)
