return {
	"shaunsingh/nord.nvim",
	name = "nord",
	lazy = false,
	priority = 999,
	config = function()
		vim.cmd([[colorscheme nord]])
	end,
}
