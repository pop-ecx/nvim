vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  {'nvim-treesitter/nvim-treesitter', build = ":TSUpdate"},
  {'ThePrimeagen/harpoon'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  --{'nvim-tree/nvim-web-devicons'},
  {'goolord/alpha-nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'}
  },
  {'nvim-tree/nvim-tree.lua',
    dependecies = {'nvim-tree/nvim-web-devicons'}
  }

}
local opts = {}
require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) 
-- nsetup treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript", "python", "php"},
  highlight = { enable = true },
  indent = {enable = true}
})
-- setup harpoon
require("harpoon").setup({
  global_settings = {
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false,
    tmux_autoclose_windows = false,
    excluded_filetypes = { "harpoon" },
    mark_branch = false,
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
  }
})
require('telescope').load_extension('harpoon')
vim.keymap.set('n', 'hx', require('harpoon.mark').add_file)
vim.keymap.set('n', 'hn', require('harpoon.ui').nav_next)
vim.keymap.set('n', 'hp', require('harpoon.ui').nav_prev)
vim.keymap.set('n', '<leader>hm', ':Telescope harpoon marks<CR>')

-- setup webdev-icons
require("nvim-web-devicons").setup()
-- setup alpha
local alpha = require("alpha")
local dashboard = require("alpha.themes.startify")
dashboard.section.header.val = {
   [[' ███████████████████████████ ']],
   [[' ███████▀▀▀░░░░░░░▀▀▀███████ ']],
   [[' ████▀░░░░░░░░░░░░░░░░░▀████ ']],
   [[' ███│░░░░░░░░░░░░░░░░░░░│███ ']],
   [[' ██▌│░░░░░░░░░░░░░░░░░░░│▐██ ']],
   [[' ██░└┐░░░░░░░░░░░░░░░░░┌┘░██ ']],
   [[' ██░░└┐░░░░░░░░░░░░░░░┌┘░░██ ']],
   [[' ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██ ']],
   [[' ██▌░│██████▌░░░▐██████│░▐██ ']],
   [[' ███░│▐███▀▀░░▄░░▀▀███▌│░███ ']],
   [[' ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██ ']],
   [[' ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██ ']],
   [[' ████▄─┘██▌░░░░░░░▐██└─▄████ ']],
   [[' █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████ ']],
   [[' ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████ ']],
   [[' █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████ ']],
   [[' ███████▄░░░░░░░░░░░▄███████ ']],
   [[' ██████████▄▄▄▄▄▄▄██████████ ']],
}
local function footer()
 return "Be yourself unless you can be batman. Then always be batman..."
end
alpha.setup(dashboard.opts)
-- setup mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "zls", "intelephense"}
})

-- setup nvim-tree
require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  },
})
-- setup lspconfig
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.zls.setup({})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

-- setup catppuccin
require("catppuccin").setup({
  transparent_background = true
})
vim.cmd.colorscheme "catppuccin"
