return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "ayu",
				component_separators = "|",
				section_separators = "",
			},
		})
	end,
}
