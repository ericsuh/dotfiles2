return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function () 
        local treesitter = require("nvim-treesitter")
        treesitter.setup()
        local langs = {
            "bash",
            "c",
            "css",
            "dockerfile",
            "gitignore",
            "go",
            "gotmpl",
            "html",
            "javascript",
            "json",
            "jsonc",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "rust",
            "sql",
            "starlark",
            "terraform",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
            "zig",
        }
        treesitter.install(langs)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = langs,
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
