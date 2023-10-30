return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	lazy = false,
	priority = 999,
	config = function()
		vim.cmd([[colorscheme gruvbox]])
	end,
}
