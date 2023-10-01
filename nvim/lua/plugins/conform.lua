return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		{
			"<leader>cf",
			function()
				-- lsp_fallback: filetypes without a formatter (go) use the LSP
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			-- go has no entry: gopls already formats on save via the LSP
		},
	},
}
