return {
	"gelguy/wilder.nvim",

	config = function()
		local wilder = require("wilder")
		wilder.setup({
			modes = { ":", "/", "?" },
			next_key = "<C-j>",
			previous_key = "<C-k>",
			accept_key = "<Down>",
			reject_key = "<Up>",
		})
		wilder.set_option(
			"renderer",
			wilder.renderer_mux({
				[":"] = wilder.popupmenu_renderer({
					highlighter = wilder.basic_highlighter(),
				}),
				["/"] = wilder.popupmenu_renderer({
					highlighter = wilder.basic_highlighter(),
				}),
				["?"] = wilder.popupmenu_renderer({
					highlighter = wilder.basic_highlighter(),
				}),
			})
		)
	end,
}
