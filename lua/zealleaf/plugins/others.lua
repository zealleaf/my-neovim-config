return {
	{ "szw/vim-maximizer" },
	{ "tpope/vim-surround" },
	{ "christoomey/vim-tmux-navigator" },
	{ "gpanders/editorconfig.nvim" },
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
