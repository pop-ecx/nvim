vim.highlight.on_yank({higroup="YankHighlight", timeout=200})
vim.cmd("highlight YankHighlight guibg=#808080 guifg=#ffffff")
vim.api.nvim_exec([[
    augroup HighlightYank
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="YankHighlight", timeout=200})
    augroup END
]], false)
