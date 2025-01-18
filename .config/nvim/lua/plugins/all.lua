return {
	"simnalamburt/vim-mundo",

	"gerazov/toggle-bool.nvim",
	-- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	"tpope/vim-commentary",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"godlygeek/tabular",
	{
		"carlfinmo/bigwrap.nvim",
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	-- {
	-- 	"nvim-orgmode/orgmode",
	-- 	config = function(
	-- 		require("orgmode").setup({}
	-- 	end,
	-- },
	-- {
	-- 	"akinsho/flutter-tools.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"stevearc/dressing.nvim", -- optional for vim.ui.select
	-- 	},
	-- },
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function(
	-- 		require("copilot").setup({
	-- 			suggestion = { enabled = false },
	-- 			panel = { enabled = false },
	-- 		}
	-- 	end,
	-- },
	"onsails/lspkind.nvim",
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function(
	-- 		require("copilot_cmp").setup(
	-- 	end,
	-- },
}
