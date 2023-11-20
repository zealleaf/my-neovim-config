return {
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup({
				toggler = {
					---Line-comment toggle keymap
					line = "<space>l",
					---Block-comment toggle keymap
					block = "<space>b",
				},
				opleader = {
					---Line-comment keymap
					line = "<space>l",
					---Block-comment keymap
					block = "<space>b",
				},
			})
		end,
	},
}
