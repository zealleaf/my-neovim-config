return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme kanagawa]])
	end,
}
