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


vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})
