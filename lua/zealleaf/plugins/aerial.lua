local setup, aerial = pcall(require, "aerial")
if not setup then
	return
end

aerial.setup({
	layout = {
		width = 0.1,
	},
})
