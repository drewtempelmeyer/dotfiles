return {
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate",
		lazy = false,
		dependencies = {
			"tree-sitter/tree-sitter-embedded-template",
		},
		config = function()
			local configs = require("nvim-treesitter.configs")
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			configs.setup({
				ensure_installed = {
					"go",
					"lua",
					"ruby",
					"vim",
					"html",
					"templ",
					"javascript",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				autotag = {
					enable = true,
					enable_close_on_slash = false,
				},
			})

			parser_config.embedded_template = {
				install_info = {
					url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
					files = { "src/parser.c" },
				},
				filetype = { "erb", "eruby" },
			}

			vim.treesitter.language.register("erb", "eruby")
		end,
	},
}
