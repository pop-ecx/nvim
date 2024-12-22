local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({capabilities = capabilities })
lspconfig.zls.setup({ capabilities = capabilities })
lspconfig.phpactor.setup({})
--lspconfig.pylyzer.setup({})
lspconfig.dockerls.setup({ capabilities = capabilities })
