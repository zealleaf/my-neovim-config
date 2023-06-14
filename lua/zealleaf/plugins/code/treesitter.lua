return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufNewFile", "BufReadPre", "BufAdd" },
	config = function()
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

		vim.treesitter.language.register("markdown", "mdx")

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"gitignore",
				"rust",
				"vue",
				"diff",
				"astro",
			},
			sync_install = true,
			auto_install = true,
			highlight = {
				enable = true,
				disable = {},
			},
			rainbow = {
				enable = true,
				extended_mode = false,
				max_file_lines = nil,
			},
			indent = { enable = true, disable = {} },
			autotag = { enable = true, disable = {} },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
