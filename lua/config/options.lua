local options = {
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  relativenumber = true,
  number = true,
  list = false,
  scrolloff = 10,
  cursorline = false,
  termguicolors = true,
  listchars = {},
  incsearch = true,
  colorcolumn = "80",
  guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

--vim.opt.listchars = {}
vim.g.mapleader = " "
--vim.opt.incsearch = true
--vim.opt.colorcolumn = "80"
--vim.opt.winborder = "rounded"
