local keymap = vim.keymap

-- Telescope
-- add dropdown theme for all pickers
local CallTelescope = function(input)
  local theme = require('telescope.themes').get_dropdown({})
  input(theme)
end
keymap.set('n', '<leader>ff', function() CallTelescope(require('telescope.builtin').find_files) end)
keymap.set('n', '<leader>fg', function() CallTelescope(require('telescope.builtin').live_grep) end)
keymap.set('n', '<leader>fb', function() CallTelescope(require('telescope.builtin').buffers) end)
keymap.set('n', '<leader>fh', function() CallTelescope(require('telescope.builtin').help_tags) end)
keymap.set('n', '<leader>fs', function() CallTelescope(require('telescope.builtin').current_buffer_fuzzy_find) end)
keymap.set('n', '<leader>fo', function() CallTelescope(require('telescope.builtin').lsp_document_symbols) end)
keymap.set('n', '<leader>fi', function() CallTelescope(require('telescope.builtin').lsp_incoming_calls) end)
keymap.set('n', '<leader>fd', function() CallTelescope(require('telescope.builtin').diagnostics) end)

keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({ default_text = ":method:" }) end)
keymap.set("n", "<leader>i", ':lua vim.diagnostic.open_float(nil)<CR>')

-- Yazi
keymap.set("n", "<leader>y", "<cmd>Yazi<cr>")
