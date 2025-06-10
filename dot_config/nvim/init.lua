local global = vim.g
local o = vim.opt

o.number = true -- Enable line numbers
o.clipboard = "unnamedplus"
o.tabstop = 4 -- Number of spaces to visualize a tab
o.shiftwidth = 4 -- Number of spaces for each indentation
o.expandtab = true -- Convert tabs to spaces
o.smartindent = true -- Autoindent new lines
o.cursorline = true -- Highlight current line
o.termguicolors = true -- Enable 24-bit color
o.syntax = "on"
o.encoding = "UTF-8"

vim.cmd('filetype plugin indent on')

global.mapleader = ','
vim.keymap.set('n', 'Y', 'yy', { remap = true })

vim.lsp.enable({
    'bashls',
    'eslint',
    'golantci-lint-ls',
    'gopls',
    'ruff',
    'rust-analyzer',
    'terraformls',
    'typescript-language-server',
})

require("config.maps")
require("config.lazy")

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
