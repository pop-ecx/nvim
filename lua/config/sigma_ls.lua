vim.api.nvim_create_autocmd('FileType', {
  pattern = 'yaml',
  callback = function (args)
    vim.lsp.start({
      name = 'sigma_ls',
      cmd = {"/home/m3lk0r/.cache/pypoetry/virtualenvs/sigma-ls-rWJJ-Mzx-py3.11/bin/python", "/home/m3lk0r/Desktop/sigma-ls/main.py"},
      root_dir = vim.loop.cwd(),
      on_attach = function(client, bufnr)
        -- Set up buffer-specific key mappings
        client.server_capabilities.documentFormattingProvider = true
      end,
    })
  end,
})
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "always",
  },
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.api.nvim_create_user_command("SearchMitre", function(opts)
    local keyword = opts.args
    vim.lsp.buf_request(0, "sigma/searchMitre", { keyword = keyword }, function(err, result)
        if err then
            vim.notify("Error: " .. err.message, vim.log.levels.ERROR)
        elseif type(result) ~= "table" then
            vim.notify("Unexpected response format from LSP server.", vim.log.levels.ERROR)
        elseif result.error then
            vim.notify("Error: " .. result.error, vim.log.levels.WARN)
        elseif result.matches then
            if #result.matches > 0 then
                local formatted_results = {}
                for _, match in ipairs(result.matches) do
                    table.insert(formatted_results, match.tag .. ": " .. match.description)
                end
                vim.notify("MITRE ATT&CK Matches:\n" .. table.concat(formatted_results, "\n"), vim.log.levels.INFO)
            else
                vim.notify("No matches found.", vim.log.levels.WARN)
            end
        else
            vim.notify("Unexpected result structure from LSP server.", vim.log.levels.ERROR)
        end
    end)
end, { nargs = 1 })


