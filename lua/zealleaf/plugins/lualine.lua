return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "Mofiqul/vscode.nvim" },
	event = "BufReadPost",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto", -- vscode
				component_separators = "|",
				section_separators = "",
			},
		})
	end,
}
