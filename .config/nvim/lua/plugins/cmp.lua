snippetconfig = function()
	local ls = require("luasnip")
	-- some shorthands...
	local snip = ls.snippet
	local node = ls.snippet_node
	local text = ls.text_node
	local insert = ls.insert_node
	local func = ls.function_node
	local choice = ls.choice_node
	local dynamicn = ls.dynamic_node

	local date = function()
		return { os.date("%Y-%m-%d") }
	end

	ls.add_snippets(nil, {
		all = {
			snip({
				trig = "date",
				namr = "Date",
				dscr = "Date in the form of YYYY-MM-DD",
			}, {
				func(date, {}),
			}),
		},
	})

	local date = function()
		return { os.date("%Y-%m-%dT%H:%M:%SZ") }
	end

	ls.add_snippets(nil, {
		all = {
			snip({
				trig = "ts",
				namr = "Ts",
				dscr = "Date in the form of YYYY-MM-DD",
			}, {
				func(date, {}),
			}),
		},
	})
end
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Autocompletion
		{ "hrsh7th/cmp-buffer" },
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		-- {'natebosch/dartlang-snippets'},
	},
	config = function()
		local cmp = require("cmp")

		local lspkind = require("lspkind")
		local cmp_format = {
			format = lspkind.cmp_format({
				mode = "symbol", -- show only symbol annotations
				maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				-- can also be a function to dynamically calculate max width such as
				-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
				show_labelDetails = true, -- show labelDetails in menu. Disabled by default

				-- The function below will be called before any actual modifications from lspkind
				-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
				-- before = function (entry, vim_item)
				--   ...
				--   return vim_item
				-- end
			}),
		}

		require("luasnip.loaders.from_vscode").lazy_load()
		lspkind.init({
			symbol_map = {
				Copilot = "",
			},
		})

		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end

		cmp.setup({
			formatting = cmp_format,
			mapping = cmp.mapping.preset.insert({
				-- scroll up and down the documentation window
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			enabled = function()
				-- disable completion in comments
				local context = require("cmp.config.context")
				return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
			end,
			sources = {
				{ name = "copilot", group_index = 2 },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "orgmode" },
				{ name = "buffer" },
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
		})
		snippetconfig()
	end,
}
