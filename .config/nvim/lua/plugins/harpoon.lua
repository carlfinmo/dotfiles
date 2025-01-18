return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim", -- compilations of lua functions
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-h>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
		-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
		-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
		-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
	end,
}
