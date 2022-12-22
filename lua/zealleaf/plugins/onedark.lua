local setup, onedark = pcall(require, "onedark")
if not setup then
	return
end

onedark.setup({
	style = "warmer",
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = false, -- use background color for virtual text
	},
})

onedark.load()
