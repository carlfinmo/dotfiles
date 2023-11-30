local neotest = require("neotest")

neotest.setup({
    diagnostic = {
        enabled = true,
    },
    adapters = {
        require("neotest-go"),
        require("neotest-rust"),
        -- require("neotest-python"),
    }
})



local function testfile()
    neotest.run.run(vim.fn.expand("%"))
end

local function toggle_testwatch()
    neotest.watch.toggle(vim.fn.expand("%"))
end

vim.keymap.set("n", "t<C-n>", neotest.run.run)
vim.keymap.set("n", "t<C-f>", testfile)
vim.keymap.set("n", "t<C-w>", toggle_testwatch)

