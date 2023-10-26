return {
	"uga-rosa/translate.nvim",
	event = "VeryLazy",
	config = function()
		require("translate").setup({
			default = {
				command = "translate_shell",
			},
		})
	end,
}
