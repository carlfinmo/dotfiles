return {
	-- "morhetz/gruvbox",
	"rebelot/kanagawa.nvim",
	lazy = false,
	config = function()
		vim.o.background = "dark" -- or "light" for light mode
		-- vim.cmd([[colorscheme gruvbox]])
		vim.cmd([[colorscheme kanagawa-wave]])
	end,
}
