vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set nolist")
vim.g.mapleader = " "
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

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
  {'nvim-tree/nvim-web-devicons'},
  {'goolord/alpha-nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'}
  },
  {
    'nvim-lualine/lualine.nvim',
     dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-nvim-lsp'},
  {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
  },
  {'saadparwaiz1/cmp_luasnip'},
  {'rafamadriz/friendly-snippets'},
  {'nvim-tree/nvim-tree.lua',
    dependecies = {'nvim-tree/nvim-web-devicons'}
  },
  {'EmranMR/tree-sitter-blade'},
  {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    "cuducos/yaml.nvim", 
    dependecies = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {'lewis6991/gitsigns.nvim',
  opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {'folke/tokyonight.nvim',
    opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
   }
}
local opts = {}
require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) 
-- setup treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript", "python", "php", "yaml", "json", "css", "html"},
  highlight = { enable = true },
  indent = {enable = true}
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.blade = {
          install_info = {
              url = "https://github.com/EmranMR/tree-sitter-blade",
              files = {"src/parser.c"},
              branch = "main",
          },
          filetype = "blade"
      }

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

local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>h5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>h6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>h7", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>h8", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>h9", function() ui.nav_file(9) end)

vim.keymap.set("n", "<leader>H", function() ui.toggle_quick_menu() end)

require('telescope').load_extension('harpoon')
vim.keymap.set('n', 'hx', require('harpoon.mark').add_file)
vim.keymap.set('n', 'hn', require('harpoon.ui').nav_next)
vim.keymap.set('n', 'hp', require('harpoon.ui').nav_prev)
vim.keymap.set('n', '<leader>hm', ':Telescope harpoon marks<CR>')

-- setup webdev-icons
require("nvim-web-devicons").setup()

--Setup gitsigns
require('gitsigns').setup({
  current_line_blame = true
})

--Configure autocomplete
local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },{
    { name = 'buffer' },
  }),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
  ensure_installed = {"lua_ls", "zls"}
})

-- setup nvim-tree
require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  },
})
vim.keymap.set('n', '<leader>nto', ':NvimTreeOpen<CR>')
vim.keymap.set('n', '<leader>ntc', ':NvimTreeOpen<CR>')

-- setup webdev-icons
require("nvim-web-devicons").setup()

-- setup lualine
require('lualine').setup({
  options = { theme = 'tokyonight' },
  sections = { lualine_c = { "os.date('%a')", 'data', "require'lsp-status'.status()" } }
})

-- setup gitsigns
require('gitsigns').setup()

--Configure autocomplete
local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },{
    { name = 'buffer' },
  }),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- setup oil
require("oil").setup()
-- vim.keymap.set("n", "-", oil.toggle_float)

-- setup lspconfig
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.zls.setup({})
lspconfig.phpactor.setup({})
lspconfig.yamlls.setup({})
lspconfig.dockerls.setup({})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

-- setup catppuccin
require("catppuccin").setup({
  transparent_background = true
})

vim.cmd.colorscheme "tokyonight" -- was catpuccin initially
vim.opt.termguicolors = true
-- remap keybinding for yanking to clipboard
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.cmd [[highlight Cursor guifg=#FF0000 guibg=#FFFFFF]]

vim.highlight.on_yank({higroup="YankHighlight", timeout=200})
-- Highlight group for yanked text
vim.cmd("highlight YankHighlight guibg=#808080 guifg=#ffffff")

-- Autocommand for highlighting yanked text
vim.api.nvim_exec([[
    augroup HighlightYank
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="YankHighlight", timeout=200})
    augroup END
]], false)
