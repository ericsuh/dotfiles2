vim.o.number = true -- Enable line numbers
vim.o.tabstop = 4 -- Number of spaces to visualize a tab
vim.o.shiftwidth = 4 -- Number of spaces for each indentation
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.smartindent = true -- Autoindent new lines
vim.o.cursorline = true -- Highlight current line
vim.o.termguicolors = true -- Enable 24-bit color

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.g.mapleader = ','
vim.keymap.set('n', 'Y', 'yy', { remap = true })

vim.treesitter.language.add('go')
vim.treesitter.language.add('javascript')
vim.treesitter.language.add('typescript')
vim.treesitter.language.add('rust')
vim.treesitter.language.add('python')

vim.lsp.enable({'gopls', 'rust-analyzer', 'typescript-language-server' })

require("config.lazy")

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
