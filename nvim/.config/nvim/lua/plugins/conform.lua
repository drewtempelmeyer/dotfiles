return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = "ConformInfo",
		opts = {
			format_on_save = {},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				ruby = { "rubocop" },
				go = { "goimports" },
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
