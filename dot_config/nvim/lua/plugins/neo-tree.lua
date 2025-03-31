return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {
        enable_git_status = true,
        sort_case_insensitive = true,
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    },
    config = function()
        vim.keymap.set("n", "<C-b>", "<Cmd>Neotree float<CR>")
    end,
}
