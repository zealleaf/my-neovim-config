return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		exclude = {
			filetypes = {
				"checkhealth",
				"help",
				"terminal",
				"markdown",
				"dashboard",
			},
			buftypes = {
				"terminal",
				"nofile",
			},
		},
		scope = {
			enabled = true,
			char = "▎",
			show_start = false,
			show_end = false,
			injected_languages = true,
			highlight = { "IndentBlanklineContextChar" },
			priority = 1024,
		},
	},
}
