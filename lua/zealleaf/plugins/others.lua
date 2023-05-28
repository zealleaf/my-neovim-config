return {
	{ "nvim-lua/plenary.nvim" },
	{ "szw/vim-maximizer" },
	{ "tpope/vim-surround" },
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{ "gpanders/editorconfig.nvim" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "christoomey/vim-tmux-navigator" },
}
