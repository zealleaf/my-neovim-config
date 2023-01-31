local status, githubTheme = pcall(require, "github-theme")
if not status then
	return
end

githubTheme.setup({
	keyword_style = "NONE",
})
