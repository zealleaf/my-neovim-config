return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	config = function()
		local status, conform = pcall(require, "conform")
		if not status then
			vim.notify("not found conform")
			return
		end

		conform.setup({
			formatters_by_ft = {
				bash = { "shfmt" },
				lua = { "stylua" },
				html = { "prettierd" },
				css = { "prettierd" },
				javascript = { "prettierd", "eslint_d" },
				typescript = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
				vue = { "prettierd", "eslint_d" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				markdown = {
					"prettierd",
					"markdownlint",
				},
				c = { "clang_format" },
				rust = { "rustfmt" },
				python = {
					formatters = { "isort", "black" },
					run_all_formatters = true,
				},
				go = {
					formatters = { "gofumpt", "goimports" },
					run_all_formatters = true,
				},
			},
		})
	end,
}
