return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-P>", builtin.find_files, {
				desc = "Telescope find files",
			})

			vim.keymap.set("n", "<leader>t", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffer" })

			require("telescope").load_extension("fzf")
		end,
		opts = {
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},
	},
}
