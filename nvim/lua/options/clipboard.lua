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

-- Auto update git checkout
vim.cmd("set autoread | au CursorHold * checktime")
