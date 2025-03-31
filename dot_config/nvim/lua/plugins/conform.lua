return {
   "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                css = { "prettier" },
                go = { "gofmt" },
                html = { "prettier" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                json = { "prettier" },
                python = { "ruff_format" },
                rust = { "rustfmt", lsp_format = "fallback" },
                tsx = { "pretter" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                yaml = { "prettier" },
            },
            format_on_save = {
                tiemout_ms = 500,
                lsp_fallback = true,
            },
        })
    end,
}
