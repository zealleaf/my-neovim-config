vim.g.indent_blankline_filetype_exclude = { "dashboard" }

vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineContextChar guifg=#666666 gui=nocombine]])

require("indent_blankline").setup({
	show_current_context = true,
})
