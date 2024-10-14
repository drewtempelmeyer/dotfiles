return {
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			local lspsig = require("lsp_signature")
			lspsig.setup(opts)

			vim.keymap.set({ "n" }, "<C-k>", function()
				lspsig.toggle_float_win()
			end, {
				silent = true,
				noremap = true,
				desc = "toggle signature",
			})
		end,
	},
}
