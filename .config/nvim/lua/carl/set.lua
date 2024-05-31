vim.opt.filetype = on
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"

vim.opt.mouse = ""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 10

vim.opt.smartindent = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.pumheight = 10

-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local ret = vim.api.nvim_get_hl(0, { name = "Normal" })
		vim.api.nvim_set_hl(0, "Unclutter", { fg = ret.bg })
	end,
})

vim.keymap.set("n", "<M-1>", ':call matchadd("One", expand("<cword>"))<CR>')
vim.keymap.set("n", "<M-2>", ':call matchadd("Two", expand("<cword>"))<CR>')
vim.keymap.set("n", "<M-3>", ':call matchadd("Three", expand("<cword>"))<CR>')

vim.api.nvim_set_hl(0, "One", { fg = "Red", bold = true })
vim.api.nvim_set_hl(0, "Two", { fg = "White", bold = true })
vim.api.nvim_set_hl(0, "Three", { fg = "#ef41fc", bold = false })
vim.api.nvim_set_hl(0, "White", { fg = "White", bold = true })
vim.api.nvim_set_hl(0, "Red", { fg = "Red", bold = true })
vim.api.nvim_set_hl(0, "White2", { fg = "#ffffff", undercurl = true })
vim.api.nvim_set_hl(0, "Grey", { fg = "#989898" })
