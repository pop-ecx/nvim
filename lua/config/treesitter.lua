local treesitter = require("nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- Add custom parser for Blade
parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "blade",
}

-- Add custom parser for YARA
parser_config.yara = {
  install_info = {
    url = "~/Desktop/tree-sitter-yara", -- or a Git URL
    files = { "src/parser.c" },
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = "yara",
}

-- Correct way to set filetypes
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
  extension = {
    yara = "yara",
    yar = "yara",
  },
})

-- Tree-sitter config
treesitter.setup({
  ensure_installed = { "lua", "javascript", "python", "php", "yaml", "json", "css", "html" },
  highlight = { enable = true },
  indent = { enable = true },
})
