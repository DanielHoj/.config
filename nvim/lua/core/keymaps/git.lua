local keymap = vim.keymap

-- GIT
keymap.set("n", "<leader>ng", require("neogit").open)
keymap.set('n', '<leader>nn',
  function() if vim.wo.diff then vim.cmd.normal({ ']c', bang = true }) else require("gitsigns").nav_hunk('next') end end)
keymap.set('n', '<leader>np',
  function() if vim.wo.diff then vim.cmd.normal({ '[c', bang = true }) else require("gitsigns").nav_hunk('prev') end end)
keymap.set('n', '<leader>ns', require("gitsigns").stage_hunk)
keymap.set('n', '<leader>nr', require("gitsigns").reset_hunk)
keymap.set('n', '<leader>nS', require("gitsigns").stage_buffer)
keymap.set('n', '<leader>nu', require("gitsigns").undo_stage_hunk)
keymap.set('n', '<leader>nR', require("gitsigns").reset_buffer)
keymap.set('n', '<leader>np', require("gitsigns").preview_hunk)
keymap.set('n', '<leader>nb', function() require("gitsigns").blame_line { full = true } end)
keymap.set('n', '<leader>ntb', require("gitsigns").toggle_current_line_blame)
keymap.set('n', '<leader>nd', ":DiffviewOpen<CR>")
keymap.set('n', '<leader>nc', ":DiffviewClose<CR>")
keymap.set('n', '<leader>ntd', require("gitsigns").toggle_deleted)

