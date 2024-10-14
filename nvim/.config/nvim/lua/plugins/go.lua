return {
	{
		"fatih/vim-go",
		build = ":GoUpdateBinaries",
		init = function()
			-- Go config
			-- disable all linters as that is taken care of by coc.nvim
			vim.g.go_diagnostics_enabled = 0
			-- vim.g.go_metalinter_enabled=""

			-- don't jump to errors after metalinter is invoked
			vim.g.go_jump_to_error = 0

			-- run go imports on file save
			vim.g.go_fmt_command = "goimports"

			-- automatically highlight variable your cursor is on
			vim.g.go_auto_sameids = 1

			-- Syntax highlighting
			vim.g.go_highlight_types = 1
			vim.g.go_highlight_fields = 1
			vim.g.go_highlight_functions = 1
			vim.g.go_highlight_function_calls = 1
			vim.g.go_highlight_operators = 1
			vim.g.go_highlight_extra_types = 1
			vim.g.go_highlight_build_constraints = 1
			vim.g.go_highlight_generate_tags = 1

			vim.g.go_def_mode = "gopls"
			vim.g.go_info_mode = "gopls"
		end,
	},
}
