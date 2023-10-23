return {
	"dinhhuy258/git.nvim",
	event = "VeryLazy",
	config = function()
		require("git").setup({
			default_mappings = false,
			keymaps = {
				-- Open file/folder in git repository
				browse = "<Leader>go",
				blame = "<Leader>gb",
			},
		})
	end,
}
