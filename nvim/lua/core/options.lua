-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Set center cursor
vim.o.scrolloff = 999

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local opt = vim.opt

-- Session Management
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
}

-- Backspace
opt.backspace = "indent,eol,start"


-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable the mouse while in nvim
opt.mouse = ""

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/.venv/bin/python")

-- Lazyload clipboard for faster startup in wsl
-- Disable automatic loading of clipboard provider
vim.g.loaded_clipboard_provider = 1


function _G.load_clipboard_provider()
  if vim.g.loaded_clipboard_provider == 1 then
    vim.g.loaded_clipboard_provider = nil
    vim.cmd('runtime autoload/provider/clipboard.vim')
    vim.opt.clipboard = 'unnamedplus'
  end
end


vim.cmd([[
  augroup LazyLoadClipboard
    autocmd!
    autocmd TextYankPost * lua _G.load_clipboard_provider()
    autocmd CmdlineEnter * lua _G.load_clipboard_provider()
  augroup END
]])

-- CMP select mode fix
vim.keymap.set("s", "c", function()
  vim.api.nvim_feedkeys("c", "n", false)
end, { silent = true, remap = false, desc = "Don't paste in select mode" })
vim.keymap.set("s", "p", function()
  vim.api.nvim_feedkeys("p", "n", false)
end, { silent = true, remap = false, desc = "Don't paste in select mode" })

