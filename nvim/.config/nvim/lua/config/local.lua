-- Relative line numbers
vim.opt.rnu = true

vim.opt.termguicolors = true

-- Colorscheme
vim.opt.background = dark

vim.opt.cursorline = false -- Don't highlight the current line
vim.opt.lazyredraw = true -- Faster scrolling
vim.opt.number = true -- Show line number
vim.opt.relativenumber = true -- Show relative line number
vim.opt.showcmd = true -- Show current command
vim.opt.showmode = true -- Show current mode
vim.opt.wildmode = "longest:list,full" -- Autocomplete
vim.opt.wildignore = "*.o,*.obj,*~" -- Ignore file
vim.opt.showmatch = true -- highlight matching braces
vim.opt.hlsearch = true -- Highlight search
vim.opt.ignorecase = true -- ignore case while searching
vim.opt.smartcase = true -- unless uppercase explicitly mentioned
vim.opt.smartindent = true -- indent smartly
vim.opt.wrap = false -- Don't wrap text
-- vim.opt.laststatus = 2 -- Always show statusbar
vim.opt.scrolloff = 5 -- Minimum space on bottom/top of window
vim.opt.sidescrolloff = 7 -- Minimum space on side
vim.opt.sidescroll = 1
vim.opt.list = false -- Don't display hidden chars as defined below
vim.opt.listchars = "tab:▷⋅,trail:⋅,nbsp:+,extends:»,precedes:«"
vim.opt.splitright = true -- Open vsp on right
vim.opt.showmode = false -- Hide mode (lightline shows mode)
vim.opt.foldenable = false -- Disable folding
vim.opt.clipboard:append({ "unnamed", "unnamedplus" }) -- Use system clipboard

-- Undo settings
vim.opt.undofile = true
vim.opt.undolevels = 1000 -- max number of changes that can be undone
vim.opt.undoreload = 10000 -- max number lines to save for undo on buffer reload

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
