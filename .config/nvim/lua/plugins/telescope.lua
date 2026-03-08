return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			-- "nvim-telescope/telescope-ui-select.nvim"
		},
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			pickers = {
				live_grep = {
					mappings = {
						i = { ["<c-f>"] = actions.to_fuzzy_refine },
					},
				},
			},
		})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f", builtin.find_files, {})
		vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>G", builtin.git_status, {})
		-- vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>Fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>Fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>T", builtin.resume, {})
		vim.keymap.set("n", "<leader>*", function()
			local word = vim.fn.expand("<cword>")
			builtin.live_grep({ default_text = word })
		end, { noremap = true })
		-- require("telescope").load_extension("ui-select")
	end,
}
