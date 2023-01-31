local status, _ = pcall(vim.cmd, "colorscheme github_dimmed")

if not status then
	print("Colorscheme not found!")
	return
end
