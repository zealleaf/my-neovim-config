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
				c = { "clang_format" },
				go = {
					formatters = { "gofumpt", "goimports" },
					run_all_formatters = true,
				},
				html = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				rust = { "rustfmt" },
				bash = { "shfmt" },
				lua = { "stylua" },
				-- Conform will use the first available formatter in the list
				javascript = { "prettierd", "eslint_d" },
				typescript = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
				vue = { "prettierd", "eslint_d" },
				-- Formatters can also be specified with additional options
				python = {
					formatters = { "isort", "black" },
					-- Run formatters one after another instead of stopping at the first success
					run_all_formatters = true,
				},
				markdown = {
					"prettierd",
					"markdownlint",
				},
			},
		})
	end,
}
