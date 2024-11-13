local keymap = vim.keymap

-- Refactoring
keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end)
keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end)
keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end)
keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end)
keymap.set("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end)
