local status, githubTheme = pcall(require, "github-theme")
if not status then
	return
end

githubTheme.setup({
	theme_style = "dimmed",
	-- keyword_style = "NONE",
})
