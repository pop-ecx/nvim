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
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.2',
      dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' }
    },
  {'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    branch = 'main',
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
  {'nvim-treesitter/nvim-treesitter-context'},
  {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },
  },
  {'mason-org/mason.nvim'},
  {'mason-org/mason-lspconfig.nvim'},
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
  {'nvim-telescope/telescope-ui-select.nvim'},
  --{'pop-ecx/sigma_picker.nvim'},
  {
    name = "sigma_picker.nvim",
    dir = "~/Desktop/sigma_picker.nvim",
  },
  {'github/copilot.vim'},
  --{'EmranMR/tree-sitter-blade'},
  {'j-hui/fidget.nvim', opts = {}},
  {'brenoprata10/nvim-highlight-colors'},
  {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
    },
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
  { 'smoka7/multicursors.nvim',
    branch = 'main',
    dependencies = {
      { 'nvimtools/hydra.nvim', branch = 'main' },
    },
  },
  {'rose-pine/neovim'},
}

local opts = {}
require("lazy").setup(plugins, opts)
