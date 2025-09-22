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

local function highlight_telescope(hl, c)
  local prompt = c.bg
  hl.TelescopeNormal = {
    bg = c.bg,
    fg = c.fg,
  }
  hl.TelescopeBorder = {
    bg = c.bg,
    fg = c.bg,
  }
  hl.TelescopePromptNormal = {
    bg = prompt,
  }
  hl.TelescopePromptBorder = {
    bg = prompt,
    fg = prompt,
  }
  hl.TelescopePromptTitle = {
    bg = c.bg_highlight,
    fg = c.fg,
  }
  hl.TelescopePreviewTitle = {
    bg = c.bg_highlight,
    fg = c.fg,
  }
  hl.TelescopeResultsTitle = {
    bg = c.bg,
    fg = c.bg,
  }
  hl.NoiceCmdlinePopupBorder = {
    bg = c.bg,
    fg = c.bg,
  }
end

local plugins = {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  {'nvim-treesitter/nvim-treesitter', build = ":TSUpdate"},
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
  {'pop-ecx/sigma_picker.nvim'},
  --{
  --  dir = "~/Desktop/sigma_picker.nvim",
  --},
  {'ThePrimeagen/vim-be-good'},
  --{'zbirenbaum/copilot.lua',
  --  cmd = "Copilot",
  --  event = "InsertEnter"},
  --{'zbirenbaum/copilot-cmp'},
  {'github/copilot.vim'},
  {'EmranMR/tree-sitter-blade'},
  {'numToStr/FTerm.nvim'},
  {'brenoprata10/nvim-highlight-colors'},
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {'folke/zen-mode.nvim'},
  {'folke/twilight.nvim'},
  {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
      view_options = {
        show_hidden = true,
      },
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
  {"Isrothy/neominimap.nvim",
      version = "v3.x.x",
      lazy = false,
      init = function()
      ---@type Neominimap.UserConfig
      vim.g.neominimap = {
        auto_enable = false,
      }
    end,
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
    on_highlights = function(hl, c)
        highlight_telescope(hl, c)
      end,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
   }
}

local opts = {}
require("lazy").setup(plugins, opts)
