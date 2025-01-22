local options = {
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  relativenumber = true,
  number = true,
  list = true,
  scrolloff = 10,
  cursorline = false,
  termguicolors = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.listchars = {}
vim.g.mapleader = " "
