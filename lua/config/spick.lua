local spick = require("sigma_picker")
spick.setup({})
vim.keymap.set('n', '<leader>sp', spick.sigma_picker, {noremap = true, silent = true})
