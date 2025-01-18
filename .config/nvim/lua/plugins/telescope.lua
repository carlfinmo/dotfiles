return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			-- "nvim-telescope/telescope-ui-select.nvim"
		},
	},
	config = function()
		require("telescope").setup()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f", builtin.find_files, {})
		vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
		-- vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>Fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>Fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>T", builtin.resume, {})
		-- require("telescope").load_extension("ui-select")
	end,
}
