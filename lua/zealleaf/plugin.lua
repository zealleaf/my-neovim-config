local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			import = "zealleaf.plugins",
		},
		{
			import = "zealleaf.plugins.code",
		},
		{
			import = "zealleaf.plugins.theme",
		},
	},
	install = {
		missing = true,
	},
	lazy = true,
	checker = {
		enabled = true,
		concurrency = nil,
		notify = true,
		frequency = 3600 * 24 * 7,
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				-- "matchit",
				-- "matchparen",
				"gzip",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"netrw_gitignore",
				"netrw",
				"getscript",
				"rrhelper",
				"rplugin",
				"spellfile",
				"logiPat",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
