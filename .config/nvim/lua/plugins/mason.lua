return {
	"mason-org/mason.nvim",
	dependencies = { "mason-org/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "rust_analyzer" },
			handlers = {
				function(server_name)
					vim.lsp.config(server_name, {}) -- new API
				end,
			},
		})
	end,
}
