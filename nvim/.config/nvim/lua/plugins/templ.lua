return {
	{
		"joerdav/templ.vim",
		ft = { "templ" },
		init = function()
			vim.filetype.add({ extension = { templ = "templ" } })
			vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
		end,
	},
}
