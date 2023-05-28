return {
	"ahmedkhalf/project.nvim",
	event = "VimEnter",
	config = function()
		local telescope = require("telescope")
		pcall(telescope.load_extension, "projects")
		vim.g.nvim_tree_respect_buf_cwd = 1

		require("project_nvim").setup({
			detection_methods = { "pattern" },
			patterns = {
				"README.md",
				"Cargo.toml",
				"package.json",
				".sln",
				".git",
				"_darcs",
				".hg",
				".bzr",
				".svn",
				"Makefile",
			},
		})
	end,
}
