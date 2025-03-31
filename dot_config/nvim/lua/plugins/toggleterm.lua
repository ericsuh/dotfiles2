return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function ()
        require("toggleterm").setup({
            open_mapping = [[<C-`>]],
            start_in_insert = true,
        })
    end,
}
