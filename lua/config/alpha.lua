local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local section = dashboard.section
local fn = vim.fn
local config = dashboard.config
local marginTopPercent = 0.3
local headerPadding = fn.max({2, fn.floor(fn.winheight(0) * marginTopPercent)})

-- Custom Header
--section.header.val = {
--            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
--            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
--            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
--            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
--            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
--            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
--}

section.header.val = {
              "                    #====================================.-=.       ",
              "                 .=-.            .%         #:.            -=:.     ",
              "                .=-.            #@@@:       #@*.             -*.    ",
              "              .--.            :*@@@@@:      #@@%-.             ==.  ",
              "              .:.             :=+@@@@@      *@@@%:.             :.  ",
              "               .-.            . =-@@@@@     =@@@%:.            :=   ",
              "                .-:.          .  ==@@@@@    =@@@@:.          ::.    ",
              "                  .=.         .   = %@@@@%  %@@@%:.        :::.     ",
              "                  .:-.        .   =  @@@@@% %@@@%:        --.       ",
              "                    .:=.      .   =   %@@@@%-%@@%:       -:.        ",
              "                     .:-.     .   =    %@@@@%-%@%:     -=.          ",
              "                       .=-.   .   =     %@@@@@-%%:    -.            ",
              "                         .-.  =   =      %@@@@@-+    =+.            ",
              "                          .=- .:  =       *@@@%.    =.              ",
              "                            .-.. :+        +@.    =:.               ",
              "                             .=:.               =-.                 ",
              "                              .-=.             +:.                  ",
              "                               .:+-.         ++.                    ",
              "                                 .+=.       *.                      ",
              "                                  .:=.    =*.                       ",
              "                                    .+=. +:.                        ",
              "                                      .=:.                          ",
}

section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
  --dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
  dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
}

-- Custom Footer
--section.footer.val = "In a world of vscodes, be Neovim" --.. os.date("%A, %d %B %Y")

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

-- Function to update footer once Lazy is ready
local function update_footer()
  local ok, lazy = pcall(require, "lazy")
  if not ok then return end
  local stats = lazy.stats()
  local ms = math.floor(stats.startuptime + 0.5)
  section.footer.val = ("⚡ Lazy: %d/%d plugins in %d ms"):format(stats.loaded, stats.count, ms)
  pcall(vim.cmd.AlphaRedraw)
end

-- If Lazy has already loaded, update immediately
if vim.g.lazy_did_setup then
  update_footer()
else
  -- Otherwise, wait for LazyDone event
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyDone",
    callback = update_footer,
  })
end
