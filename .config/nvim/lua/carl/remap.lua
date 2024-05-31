vim.keymap.set("n", "<C-Right>", ":tabnext<CR>")
vim.keymap.set("n", "<C-Left>", ":tabprev<CR>")

-- ThePrimagens pastes
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "<space>", ":")

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

-- vim.diagnostic.get(0, { severity = { min = vim.diagnostic.severity.WARN } })
-- local goto_opts = {severity k
-- vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next)
vim.keymap.set("n", "]l", ":lnext<CR>")
vim.keymap.set("n", "[l", ":lprev<CR>")
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O", opts)

vim.keymap.set("n", ";{", "va{o^")

vim.keymap.set("n", "<leader>ff", ":Format<CR>", { silent = true })

-- send to other tmux pane
vim.keymap.set("v", "<leader>tc", 'y<cr>:call system("tmux load-buffer -w -", @0)<cr>gv')
vim.keymap.set("v", "<leader>st", 'y<cr>:call system("tmux load-buffer -w -; tmux paste-buffer -t +", @0)<cr>')
