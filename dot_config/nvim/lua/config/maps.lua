vim.g.mapleader = ","

local function map(mode, keys, cmd)
    vim.keymap.set(mode, keys, cmd, { silent = true })
end

map("n", "<leader>/", "<CMD>noh<CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
