
vim.keymap.set("n", "<C-Right>", ":tabnext<CR>")
vim.keymap.set("n", "<C-Left>", ":tabprev<CR>")

-- ThePrimagens pastes
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set('i', "{<CR>", "{<CR>}<ESC>O", opts)
