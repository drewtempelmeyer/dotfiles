return {
	{
		"folke/trouble.nvim",
		opts = {
			win = {
				type = "float",
			},
			modes = {
				preview_float = {
					mode = "diagnostics",
					filter = { buf = 0 }, -- limit to current buffer
					preview = {
						type = "float",
						relative = "editor",
						border = "rounded",
						title = "Preview",
						title_pos = "center",
						position = { 0, -2 },
						size = {
							width = 0.3,
							height = 0.3,
						},
						zindex = 200,
					},
				},
			},
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble preview_float toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
