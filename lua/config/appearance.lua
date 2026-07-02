require("nvim-web-devicons").setup()
require("lualine").setup({ options = { theme = "rose-pine" } })

require("rose-pine").setup({
    disable_background = true,
    extend_background_behind_borders = true,
    --highlight_groups = {
    --["@property.yaml"] = { fg = "iris", bold = true },
    --["@string.yaml"]   = { fg = "foam" },
    --["@number.yaml"]   = { fg = "gold" },
    --["yamlBlockMappingKey"] = { fg = "iris", bold = true },
  --},
  --    highlight_groups = {
  --      TelescopeBorder = {
  --          fg = "base",
  --          bg = "base",
  --      },
  --      TelescopeNormal = {
  --          bg = "base",
  --      },

  --      TelescopePromptBorder = {
  --          fg = "surface",
  --          bg = "surface",
  --      },
  --      TelescopePromptNormal = {
  --          bg = "surface",
  --      },

  --      TelescopePromptTitle = {
  --          fg = "surface",
  --          bg = "surface",
  --      },
  --      TelescopeResultsTitle = {
  --          fg = "base",
  --          bg = "base",
  --      },
  --      TelescopePreviewTitle = {
  --          fg = "base",
  --          bg = "base",
  --      },
  --  },

    styles = {
        bold = true,
        italic = true,
        transparency = false,
  },
})
vim.cmd.colorscheme("rose-pine-moon")
