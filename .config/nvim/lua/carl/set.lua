vim.opt.filetype = on
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:1'

vim.opt.mouse = ''

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

vim.keymap.set('v', '<leader>tc', 'y<cr>:call system("tmux load-buffer -w -", @0)<cr>gv')
vim.keymap.set('v', '<leader>st', 'y<cr>:call system("tmux load-buffer -w -; tmux paste-buffer -t +", @0)<cr>')

vim.api.nvim_set_hl(0, 'White', { fg = "White", bold = true })
vim.api.nvim_set_hl(0, 'Red', { fg = "Red", bold = true })
vim.api.nvim_set_hl(0, 'White2', { fg = "#ffffff", undercurl = true })

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})
