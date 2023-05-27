return {
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		event = "VeryLazy",
		config = function()
			require("Comment").setup({
				toggler = {
					---Line-comment toggle keymap
					line = "gc",
					---Block-comment toggle keymap
					block = "gb",
				},
				opleader = {
					---Line-comment keymap
					line = "gc",
					---Block-comment keymap
					block = "gb",
				},
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
}
