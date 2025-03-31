return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({'fzf-vim'})
        vim.keymap.set("n", "<C-p>", "<Cmd>FzfLua files<CR>")
        vim.keymap.set("n", "<CS-p>", "<Cmd>FzfLua commands<CR>")
    end,
}
