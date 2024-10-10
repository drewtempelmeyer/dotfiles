return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"olimorris/neotest-rspec",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-python",
			"sluongng/neotest-bazel",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-go"),
					require("neotest-rspec"),
					require("neotest-python"),
					require("neotest-bazel"),
				},
			})
		end,
		keys = {
			{
				"<leader>tt",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run File",
			},
			{
				"<leader>tr",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Nearest",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle Summary",
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		optional = true,
    -- stylua: ignore
    keys = {
      { "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug Nearest" },
    },
	},
}
