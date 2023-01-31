local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	ui = {
		winblend = 10,
		border = "rounded",
		colors = {
			normal_bg = "#002b36",
		},
	},
})

local opts = {
	noremap = true,
	silent = true,
}
vim.keymap.set("n", "gh", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "gl", ":LspRestart<CR>", opts)
vim.keymap.set("n", "gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
vim.keymap.set("n", "gs", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
-- gf 根据文件路径跳转 cmp-path
