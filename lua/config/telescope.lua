require('telescope').setup({
    pickers = {
        find_files = {
            layout_config = {
                prompt_position = 'top',
            },
            sorting_strategy = 'ascending',
        },
        live_grep = {
            layout_config = {
                prompt_position = 'top',
            },
            sorting_strategy = 'ascending',
        },
    },
})
