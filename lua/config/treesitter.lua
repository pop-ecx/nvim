require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "javascript", "python", "php", "yaml", "json", "css", "html" },
  highlight = { enable = true },
  indent = { enable = true },
})
