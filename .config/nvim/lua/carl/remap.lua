vim.keymap.set("n", "<C-Right>", ":tabnext<CR>")
vim.keymap.set("n", "<C-Left>", ":tabprev<CR>")

-- ThePrimagens pastes
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "<space>", ":")
-- vim.keymap.set("n", "<return>", ":")

-- local keymap = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
-- keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
-- keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
-- keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
-- keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

-- vim.diagnostic.get(0, { severity = { min = vim.diagnostic.severity.WARN } })
-- local goto_opts = {severity k
-- vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next)
vim.keymap.set("n", "]l", ":lnext<CR>")
vim.keymap.set("n", "[l", ":lprev<CR>")
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O", opts)

vim.keymap.set("n", ";{", "va{o^")

-- send to other tmux pane
vim.keymap.set("v", "<leader>tc", 'y<cr>:call system("tmux load-buffer -w -", @0)<cr>gv')
-- vim.keymap.set("v", "<leader>st", '"ay<cr>:call system("tmux load-buffer -w -; tmux paste-buffer -t +", @a)<cr>')
vim.keymap.set(
	"v",
	"<leader>st",
	'"ty<cr>:call system("tmux set-buffer -b vimtmp " . shellescape(@t) . " && tmux paste-buffer -b vimtmp -t +")<cr>'
)

local function toggle_quickfix()
	local windows = vim.fn.getwininfo()
	for _, win in pairs(windows) do
		if win["quickfix"] == 1 then
			vim.cmd.cclose()
			return
		end
	end
	vim.cmd.copen()
end

vim.keymap.set("n", "<F3>", toggle_quickfix, { desc = "Toggle Quickfix Window" })
vim.keymap.set("n", "<leader>qf", toggle_quickfix, { desc = "Toggle Quickfix Window" })

vim.keymap.set("n", "<F4>", function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local bufnr = vim.api.nvim_win_get_buf(win)
		local buftype = vim.bo[bufnr].buftype

		if buftype ~= "" then
			vim.api.nvim_win_close(win, true)
		end
	end
end, { desc = "Close all non-normal buffers" })

vim.keymap.set("n", "<F16>", function()
	local current_win = vim.api.nvim_get_current_win()
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		if win ~= current_win then
			vim.api.nvim_win_close(win, true)
		end
	end
end, { desc = "Close other windows in current tab" })
