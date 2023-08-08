return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "Mofiqul/vscode.nvim" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "vscode",
				component_separators = "|",
				section_separators = "",
			},
		})
	end,
}
