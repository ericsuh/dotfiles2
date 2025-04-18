return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('lualine').setup({
            options = {
                theme = "codedark",
            },
            sections = {
                lualine_a = {
                    { "mode", fmt = function(str) return str:sub(1,1) end },
                },
                lualine_c = {
                    "filename",
                },
                lualine_b = {
                    "branch",
                    "diff",
                    "diagnostics",
                },
                lualine_x = {
                    "filetype",
                },
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
        })
    end,
}
