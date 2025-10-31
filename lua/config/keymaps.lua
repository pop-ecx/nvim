vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
--@ telescope
vim.keymap.set('n', '<C-p>', function() require("telescope.builtin").find_files({ hidden = true }) end)
vim.keymap.set('n', '<leader>fg', require("telescope.builtin").live_grep)
vim.keymap.set('n', '<leader>of', require("telescope.builtin").oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sk', require("telescope.builtin").keymaps, { desc = '[S]earch Keymaps ' })
vim.keymap.set('n', '<leader><leader>', require("telescope.builtin").buffers, { desc = '[] Find existing buffers' })
vim.keymap.set('n', '<leader>ds', ':Telescope lsp_document_symbols<CR>', {noremap = true, silent=true})
vim.keymap.set('n', '<leader>gf', ':Telescope git_files<CR>', {noremap = true, silent=true})
vim.keymap.set('n', '<leader>fh', function() require("telescope.builtin").help_tags() end)
vim.keymap.set('n', '<leader>gs', function() require("telescope.builtin").git_status() end)
vim.keymap.set('n', '<leader>pl', function() require("telescope.builtin").planets() end)
vim.keymap.set('n', '<leader>ps', function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep for > ")}) end)

--@ grapple because harpoon2 is f****d
vim.keymap.set("n", "<M-1>", "<cmd>Grapple select index=1<cr>", { desc = "Tag 1" })
vim.keymap.set("n", "<M-2>", "<cmd>Grapple select index=2<cr>", { desc = "Tag 2" })
vim.keymap.set("n", "<M-3>", "<cmd>Grapple select index=3<cr>", { desc = "Tag 3" })
vim.keymap.set("n", "<M-4>", "<cmd>Grapple select index=4<cr>", { desc = "Tag 4" })
vim.keymap.set("n", "<M-5>", "<cmd>Grapple select index=5<cr>", { desc = "Tag 5" })
vim.keymap.set("n", "<M-H>", "<cmd>Grapple toggle_tags<cr>", { desc = "Tags menu" })

----require('telescope').load_extension('harpoon')
vim.keymap.set('n', '<leader>hx', "<cmd>Grapple toggle<cr>", { desc = "Tag / Untag file" })
vim.keymap.set('n', 'hn', "<cmd>Grapple cycle_tags next<cr>")
vim.keymap.set('n', 'hp', "<cmd>Grapple cycle_tags next<cr>")
--vim.keymap.set('n', '<leader>hm', ':Telescope harpoon marks<CR>')

--@ lsp
vim.api.nvim_set_keymap('n', '<leader>lss', ':LspStart<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lst', ':LspStop<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lsp', ':LspInfo<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'single'}) end, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, {})
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, {})

--@UndotreeToggle
vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

--@terminal mode
vim.keymap.set('t', '<C-e>', "<C-\\><C-n><C-w>h",{silent = true})
--vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>t', ':terminal<CR>', { noremap = true, silent = true })

--@neogit
vim.keymap.set('n', '<leader>ng', ':Neogit<CR>', { noremap = true, silent = true })

-- @oil
vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<C-n>", ":lua require('oil.actions').new()<CR>", { desc = "Create new file/directory in Oil" })
vim.keymap.set("n", "<leader>q", ":bd!<CR>", { desc = "Close Oil.nvim buffer" })

-- @zenmode
vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>", { desc = "Enter the zen" })

-- @disable arrow keys
vim.keymap.set("n", "<Left>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Down>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Up>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Right>", "<Nop>", { silent = true })

-- @base64 decode
vim.keymap.set('v', '<leader>bd', [[y:lua vim.fn.setreg('"', vim.fn.system('base64 -w 0 --decode', vim.fn.getreg('"')))<cr>gvP]], { noremap = true, silent = true })

-- neominimap
vim.keymap.set('n', '<leader>ntt', '<cmd>Neominimap tabToggle<cr>', { desc = "Toggle minimap for current tab" })
vim.keymap.set('n', '<leader>nc', '<cmd>Neominimap off<cr>', { desc = "Disable global minimap" })
vim.keymap.set('n', '<leader>nf', '<cmd>Neominimap focus<cr>', { desc = "Focus on minimap" })
vim.keymap.set('n', '<leader>nu', '<cmd>Neominimap unfocus<cr>', { desc = "Unfocus minimap" })

-- copilot.vim
vim.api.nvim_set_keymap('i', '<M-CR>', 'copilot#Accept("<CR>")', { expr=true, noremap = true, silent = true })
vim.g.copilot_no_tab_map = true

-- handy ones I stole from thePrimeagen
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
