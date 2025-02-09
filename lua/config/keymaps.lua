vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
--@ telescope
vim.keymap.set('n', '<C-p>', function() require("telescope.builtin").find_files({ hidden = true }) end)
vim.keymap.set('n', '<leader>fg', require("telescope.builtin").live_grep)
vim.keymap.set('n', '<leader>of', require("telescope.builtin").oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sk', require("telescope.builtin").keymaps, { desc = '[S]earch Keymaps ' })
vim.keymap.set('n', '<leader><leader>', require("telescope.builtin").buffers, { desc = '[] Find existing buffers' })
vim.keymap.set('n', '<leader>ds', ':Telescope lsp_document_symbols<CR>', {noremap = true, silent=true})

--@ harpoon
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>h5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>h6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>h7", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>h8", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>h9", function() ui.nav_file(9) end)
vim.keymap.set("n", "<leader>H", function() ui.toggle_quick_menu() end)

require('telescope').load_extension('harpoon')
vim.keymap.set('n', 'hx', require('harpoon.mark').add_file)
vim.keymap.set('n', 'hn', require('harpoon.ui').nav_next)
vim.keymap.set('n', 'hp', require('harpoon.ui').nav_prev)
vim.keymap.set('n', '<leader>hm', ':Telescope harpoon marks<CR>')

--@ lsp
vim.api.nvim_set_keymap('n', '<leader>lss', ':LspStart<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lst', ':LspStop<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lsp', ':LspInfo<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

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
vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>", { desc = "Close Oil.nvim buffer" })
