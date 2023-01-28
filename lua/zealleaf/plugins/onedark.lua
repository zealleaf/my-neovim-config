local setup, onedark = pcall(require, "onedark")
if not setup then
	return
end

local c = require("onedark.colors")

local colors = {
	Fg = {
		fg = c.fg,
	},
	LightGrey = {
		fg = c.light_grey,
	},
	Grey = {
		fg = c.grey,
	},
	Red = {
		fg = c.red,
	},
	Cyan = {
		fg = c.cyan,
	},
	Yellow = {
		fg = c.yellow,
	},
	Orange = {
		fg = c.orange,
	},
	Green = {
		fg = c.green,
	},
	Blue = {
		fg = c.blue,
	},
	Purple = {
		fg = c.purple,
	},
}

onedark.setup({
	style = "warmer",
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = false, -- use background color for virtual text
	},
	highlights = {
		CmpItemAbbrMatch = colors.Blue,
		rainbowcol1 = colors.LightGrey,
		PmenuSel = { fg = c.bg0, bg = c.orange },
	},
})

onedark.load()
