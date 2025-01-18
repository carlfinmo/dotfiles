-- local lsp_zero = require("lsp-zero")

-- lsp_zero.on_attach(function(client, bufnr)
-- 	-- see :help lsp-zero-keybindings
-- 	-- to learn the available actions
-- 	lsp_zero.default_keymaps({ buffer = bufnr })
-- end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		-- lsp_zero.default_setup,
		-- lua_ls = function()
		-- 	local lua_opts = lsp_zero.nvim_lua_ls()
		-- 	require("lspconfig").lua_ls.setup(lua_opts)
		-- end,
	},
})

vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

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
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "]e", function()
			vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } })
		end, opts)
		vim.keymap.set("n", "[e", function()
			vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } })
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

-- local dart_lsp = lsp.build_options('dartls', {})
-- require('flutter-tools').setup({lsp = dart_lsp})
