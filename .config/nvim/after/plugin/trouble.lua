local trouble = require("trouble");
trouble.setup({
    icons = false,
})

vim.keymap.set("n", "]t", function() trouble.next({skip_groups = true, jump = true}); end, opts)
vim.keymap.set("n", "[t", function() trouble.previous({skip_groups = true, jump = true}); end, opts)
