return {
	"projekt0n/github-nvim-theme",
	lazy = true, -- When not using this theme, if lazy is not set to true, an error may be reported
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme github_light]])
	end,
}
