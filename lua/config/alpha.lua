local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local section = dashboard.section
local fn = vim.fn
local config = dashboard.config
local marginTopPercent = 0.3
local headerPadding = fn.max({2, fn.floor(fn.winheight(0) * marginTopPercent)})

-- Custom Header
section.header.val = {
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

-- Custom Buttons
section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
  dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Custom Footer
section.footer.val = "Always be yourself...unless you can be batman. Then always be batman " --.. os.date("%A, %d %B %Y")

-- Custom Layout
config.layout = {
  { type = 'padding', val = headerPadding },
  section.header,
  { type = 'padding', val = 2 },
  section.buttons,
  { type = 'padding', val = 1 },
  section.footer,
}

-- Setup Alpha with the custom config
alpha.setup(config)
