local keymap = vim.keymap

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>1", function() require("harpoon.ui").nav_file(1) end)
keymap.set("n", "<leader>2", function() require("harpoon.ui").nav_file(2) end)
keymap.set("n", "<leader>3", function() require("harpoon.ui").nav_file(3) end)
keymap.set("n", "<leader>4", function() require("harpoon.ui").nav_file(4) end)
keymap.set("n", "<leader>5", function() require("harpoon.ui").nav_file(5) end)
keymap.set("n", "<leader>6", function() require("harpoon.ui").nav_file(6) end)
keymap.set("n", "<leader>7", function() require("harpoon.ui").nav_file(7) end)
keymap.set("n", "<leader>8", function() require("harpoon.ui").nav_file(8) end)
keymap.set("n", "<leader>9", function() require("harpoon.ui").nav_file(9) end)

