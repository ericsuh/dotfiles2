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
vim.keymap.set('n', 'Y', 'yy')
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)

vim.lsp.enable({
    'golangci_lint_ls',
    'gopls',
    'ruff',
    'rust_analyzer',
    'terraformls',
    'typescript_language_server',
})

require("config.maps")
require("config.lazy")

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end
 
    -- Set up Tab to accept completion
    vim.keymap.set('i', '<Tab>', function()
      if vim.fn.pumvisible() == 1 then
        return '<C-y>'
      else
        return '<Tab>'
      end
    end, { expr = true, buffer = ev.buf })
  end,
})
