require("nvim-web-devicons").setup()
require("lualine").setup({ options = { theme = "rose-pine" } })

require("rose-pine").setup({
    disable_background = true,
    extend_background_behind_borders = true
})
vim.cmd.colorscheme("rose-pine-main")
