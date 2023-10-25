return {
	{ "szw/vim-maximizer", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	{ "gpanders/editorconfig.nvim", event = "VeryLazy" },
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
