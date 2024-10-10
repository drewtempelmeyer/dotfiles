return {
	{
		"dense-analysis/ale",
		init = function()
			local g = vim.g

			-- ALE config
			g.ale_fixers = {
				["*"] = { "remove_trailing_lines", "trim_whitespace" },
			}

			-- Fix files on save
			g.ale_fix_on_save = 1

			-- Ruby config
			g.ale_ruby_rubocop_auto_correct_all = 1

			g.ale_linters = {
				ruby = { "rubocop", "ruby" },
				lua = { "lua_language_server" },
			}
		end,
	},
}
