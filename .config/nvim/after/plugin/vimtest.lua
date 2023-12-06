local neotest = require("neotest")

neotest.setup({
    diagnostic = {
        enabled = true,
    },
    adapters = {
        require("neotest-go"),
        require("neotest-rust"),
        require("neotest-python"),
        require('neotest-dart') {
             command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
                                  -- Change it to `fvm flutter` if using FVM
                                  -- change it to `dart` for Dart only tests
             use_lsp = true,      -- When set Flutter outline information is used when constructing test name.
             -- Useful when using custom test names with @isTest annotation
             custom_test_method_names = {},
      }
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

