return {
	"nvim-neotest/neotest",
	cmd = { "Neotest" },
	keys = { "t<C-n>" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-treesitter/nvim-treesitter" },
		{
			"nvim-treesitter/nvim-treesitter", -- Optional, but recommended
			branch = "main", -- NOTE; not the master branch!
			build = function()
				vim.cmd(":TSUpdate go")
			end,
		},
		{
			"fredrikaverpil/neotest-golang",
			version = "*", -- Optional, but recommended; track releases
			build = function()
				vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
			end,
		},
		"nvim-neotest/neotest-python",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local neotest = require("neotest")

		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)

		local neotest_golang_opts = { -- Specify configuration
			runner = "go",
			go_test_args = {
				"-v",
				"-race",
				"-count=1",
				"-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
			},
		}

		neotest.setup({
			diagnostic = {
				enabled = true,
			},
			adapters = {
				require("neotest-golang")(neotest_golang_opts),
				require("neotest-python"),
			},
		})

		local function testfile()
			neotest.run.run(vim.fn.expand("%"))
		end

		local function toggle_testwatch()
			neotest.watch.toggle(vim.fn.expand("%"))
		end

		vim.keymap.set("n", "t<C-n>", neotest.run.run)
		vim.keymap.set("n", "t<C-f>", testfile)
		vim.keymap.set("n", "t<C-w>", toggle_testwatch)
	end,
}
