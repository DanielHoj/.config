local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>wq", ":wq<CR>")                                    -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>")                                    -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>")                                     -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>")                              -- open URL under cursor
keymap.set("i", "jj", "<Esc>", { noremap = false })                         -- exit insert mode with jj
keymap.set("n", "<space><space>", "<cmd>set nohlsearch<CR>")                -- remove highligh
keymap.set("n", "<leader><CR>", "o<Esc>", { noremap = false })              -- new line with leader enter
keymap.set("v", "p", '"_dP', { noremap = true, silent = true })             -- keep yanked reg when pasted in visual
keymap.set("v", "P", '"_dP', { noremap = true, silent = true })             -- keep yanked reg when pasted in visual
keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true }) -- exit terminal with esc


-- Splits
keymap.set('n', '<A-h>', require('smart-splits').resize_left)
keymap.set('n', '<A-j>', require('smart-splits').resize_down)
keymap.set('n', '<A-k>', require('smart-splits').resize_up)
keymap.set('n', '<A-l>', require('smart-splits').resize_right)
keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)

-- Indent stuff
keymap.set('v', '<', '<gv', { noremap = true, silent = true })
keymap.set('v', '>', '>gv', { noremap = true, silent = true })
keymap.set('n', '>', '>>', { noremap = true, silent = true })
keymap.set('n', '<', '<<', { noremap = true, silent = true })


-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>")  -- open quickfix list
keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>")  -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>")  -- jump to prev quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>")  -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

-- Telescope
-- add dropdown theme for all pickers
local CallTelescope = function(input)
  local theme = require('telescope.themes').get_dropdown({})
  input(theme)
end
keymap.set('n', '<leader>ff', function() CallTelescope(require('telescope.builtin').find_files) end, {})
keymap.set('n', '<leader>fg', function() CallTelescope(require('telescope.builtin').live_grep) end, {})
keymap.set('n', '<leader>fb', function() CallTelescope(require('telescope.builtin').buffers) end, {})
keymap.set('n', '<leader>fh', function() CallTelescope(require('telescope.builtin').help_tags) end, {})
keymap.set('n', '<leader>fs', function() CallTelescope(require('telescope.builtin').current_buffer_fuzzy_find) end, {})
keymap.set('n', '<leader>fo', function() CallTelescope(require('telescope.builtin').lsp_document_symbols) end, {})
keymap.set('n', '<leader>fi', function() CallTelescope(require('telescope.builtin').lsp_incoming_calls) end, {})
keymap.set('n', '<leader>fd', function() CallTelescope(require('telescope.builtin').diagnostics) end, {})
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({ default_text = ":method:" }) end)
keymap.set("n", "<leader>i", ':lua vim.diagnostic.open_float(nil, {focus=true, scope="cursor"})<CR>')

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

-- Vim REST Console
-- keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- LSP
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', '<leader>gr', '<CMD>Glance references<CR>')
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')
keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set("n", "<leader>a", require("lspimport").import)

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", '<leader>dd', function()
  require('dap').disconnect(); require('dapui').close();
end)
keymap.set("n", '<leader>dt', function()
  require('dap').terminate(); require('dapui').close();
end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
keymap.set("n", '<leader>d?',
  function()
    local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
  end)
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({ default_text = ":E:" }) end)

-- Yazi
keymap.set("n", "<leader>y", "<cmd>Yazi<cr>")

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

-- Jupyter notebook, with molten.nvim
keymap.set("n", "<leader>mi", ":MoltenInit<CR>",
  { silent = true, desc = "Initialize the plugin" })
keymap.set("v", "<leader>mr", ":<C-u>MoltenEvaluateVisual<CR>gv",
  { silent = true, desc = "evaluate visual selection" })
keymap.set("n", "<leader>mr", ":MoltenEvaluateLine<CR>",
  { silent = true, desc = "evaluate line" })
keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>",
  { silent = true, desc = "hide output" })
keymap.set("n", "<leader>ms", ":noautocmd MoltenEnterOutput<CR>",
  { silent = true, desc = "show/enter output" })

-- REPL
keymap.set("n", "<leader>cr", function() require('nvim-python-repl').send_statement_definition() end)
keymap.set("v", "<leader>cr", function() require('nvim-python-repl').send_visual_to_repl() end)
keymap.set("n", "<leader>cb", function() require('nvim-python-repl').send_buffer_to_repl() end)
keymap.set("n", "<leader>ct", function() require('nvim-python-repl').toggle_execute() end)
keymap.set("n", "<leader>ch", function() require('nvim-python-repl').toggle_vertical() end)
keymap.set("n", "<leader>cw", function() require('nvim-python-repl').open_repl() end)

-- Refactoring
keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end)
keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end)
keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end)
keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end)
keymap.set("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end)
