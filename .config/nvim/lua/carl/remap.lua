
vim.keymap.set("n", "<C-Right>", ":tabnext<CR>")
vim.keymap.set("n", "<C-Left>", ":tabprev<CR>")

-- vim test
vim.keymap.set("n", "t<C-n>", ":TestNearest<CR>")
vim.keymap.set("n", "t<C-f>", ":TestFile<CR>")
vim.keymap.set("n", "t<C-l>", ":TestLast<CR>")

-- ThePrimagens pastes
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set('i', "{<CR>", "{<CR>}<ESC>O", opts)
