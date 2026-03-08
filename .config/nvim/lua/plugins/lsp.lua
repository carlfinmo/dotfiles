return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	opts = {
		servers = {
			lua_ls = {},
			gopls = {},
			rust_analyzer = {},
		},
	},

	config = function(_, opts)
		vim.opt.signcolumn = "yes"

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				-- local opts = {buARST = bufnr, remap = false}
				local opts = { buffer = ev.buf }

				vim.keymap.set("n", "<leader>d", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "<leader>t", function()
					vim.lsp.buf.type_definition()
				end, opts)
				vim.keymap.set("n", "<leader>D", function()
					vim.lsp.buf.declaration()
				end, opts)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set("n", "<leader>i", function()
					vim.lsp.buf.implementation()
				end, opts)
				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "]e", function()
					vim.diagnostic.jump({ count = 1, severity = { min = vim.diagnostic.severity.WARN } })
				end, opts)
				vim.keymap.set("n", "[e", function()
					vim.diagnostic.jump({ count = -1, severity = { min = vim.diagnostic.severity.WARN } })
				end, opts)
				vim.keymap.set("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, opts)
				vim.keymap.set("n", "<leader>vrr", function()
					vim.lsp.buf.references()
				end, opts)
				vim.keymap.set("n", "<leader>vrn", function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end,
		})
	end,
}
