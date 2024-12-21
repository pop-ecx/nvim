require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "javascript", "python", "php", "yaml", "json", "css", "html" },
  highlight = { enable = true },
  indent = { enable = true },
})
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
