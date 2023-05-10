local status, git = pcall(require, "git")
if not status then
	return
end

git.setup({
	default_mappings = false,
	keymaps = {
		-- Open file/folder in git repository
		browse = "<Leader>go",
		blame = "<Leader>gb",
	},
})
