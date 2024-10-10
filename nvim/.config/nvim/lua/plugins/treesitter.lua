return {
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate",
		lazy = false,
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
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
		end,
	},
}
