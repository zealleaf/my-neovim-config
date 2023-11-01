return {
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		event = "VeryLazy",
		config = function()
			vim.cmd("autocmd BufEnter * set formatoptions-=cro")
			vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

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
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
}
