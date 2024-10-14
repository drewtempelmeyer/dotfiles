return {
	{
		"neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
		lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
		dependencies = { -- main one
			{
				"ms-jpq/coq_nvim",
				branch = "coq",
			}, -- 9000+ Snippets
			{
				"ms-jpq/coq.artifacts",
				branch = "artifacts",
			}, -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
			-- Need to **configure separately**
			{
				"ms-jpq/coq.thirdparty",
				branch = "3p",
			},
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = true, -- if you want to start COQ at startup
				keymap = {
					recommended = true,
					jump_to_mark = "<C-f>",
				},
				display = {
					statusline = {
						helo = false,
					},
				},
			}
		end,
		config = function()
			local masonlsp = require("mason-lspconfig")
			local lsp = require("lspconfig")
			local coq = require("coq")

			require("mason").setup()

			local handlers = {
				function(server_name)
					lsp[server_name].setup(coq.lsp_ensure_capabilities({}))
				end,
			}

			masonlsp.setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"ruby_lsp",
					"ruff",
					"eslint",
					"harper_ls",
					"emmet_ls",
					"html",
					"htmx",
					"templ",
					"omnisharp",
				},
				automatic_installation = true,
				handlers = handlers,
			})

			lsp.html.setup(coq.lsp_ensure_capabilities({
				filetypes = { "html", "templ" },
			}))

			lsp.htmx.setup(coq.lsp_ensure_capabilities({
				filetypes = { "html", "templ" },
			}))
		end,
	},
}
