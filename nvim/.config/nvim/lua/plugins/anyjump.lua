return {
	{
		"pechorin/any-jump.vim",
		cmd = "AnyJump",
		event = { "BufReadPost" },
		keys = {
			{
				"<leader>j",
				"<cmd>AnyJump<CR>",
				desc = "Jump to definition",
			},
		},
	},
}
