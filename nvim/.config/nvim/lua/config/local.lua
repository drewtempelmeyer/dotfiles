-- Relative line numbers
vim.o.rnu = true

-- Show tabs and spaces
vim.o.list = true -- Don't display hidden chars as defined below
vim.o.listchars = "tab:>.,trail:.,extends:#,nbsp:."

vim.o.termguicolors = true

-- Colorscheme
vim.o.background = dark

vim.o.cursorline = false -- Don't highlight the current line
vim.o.lazyredraw = true -- Faster scrolling
vim.o.number = true -- Show line number
vim.o.relativenumber = true -- Show relative line number
vim.o.showcmd = true -- Show current command
vim.o.showmode = true -- Show current mode
vim.o.wildmode = "longest:list,full" -- Autocomplete
vim.o.wildignore = "*.o,*.obj,*~" -- Ignore file
vim.o.showmatch = true -- highlight matching braces
vim.o.hlsearch = true -- Highlight search
vim.o.ignorecase = true -- ignore case while searching
vim.o.smartcase = true -- unless uppercase explicitly mentioned
vim.o.smartindent = true -- indent smartly
vim.o.wrap = false -- Don't wrap text
-- vim.o.laststatus = 2 -- Always show statusbar
vim.o.scrolloff = 5 -- Minimum space on bottom/top of window
vim.o.sidescrolloff = 7 -- Minimum space on side
vim.o.sidescroll = 1
vim.o.splitright = true -- Open vsp on right
vim.o.showmode = false -- Hide mode (lightline shows mode)
vim.o.foldenable = false -- Disable folding
vim.o.clipboard = "unnamedplus" -- Use system clipboard

-- Undo settings
vim.o.undofile = true
vim.o.undolevels = 1000 -- max number of changes that can be undone
vim.o.undoreload = 10000 -- max number lines to save for undo on buffer reload

-- Open Telescope on start
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then
			require("telescope.builtin").find_files()
		end
	end,
})

-- Create Format function to format files manually
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

-- Restore last position when opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local api = vim.api
		local row, column = unpack(api.nvim_buf_get_mark(0, '"'))
		local buf_line_count = api.nvim_buf_line_count(0)

		if row >= 1 and row <= buf_line_count then
			api.nvim_win_set_cursor(0, { row, column })
		end
	end,
})
