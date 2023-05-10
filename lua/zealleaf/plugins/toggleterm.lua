local status, toggleterm = pcall(require, "toggleterm")
if not status then
	return
end

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
	vim.keymap.set("t", "<C-[>", [[<C-\><C-n>]])
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

toggleterm.setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.3
		end
	end,
	start_in_insert = true,
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "double",
	},
	on_open = function(term)
		vim.cmd("startinsert!")
		-- q / <leader>tg 关闭 terminal
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<leader>tg", "<cmd>close<CR>", { noremap = true, silent = true })
		-- ESC 键取消，留给lazygit
		if vim.fn.mapcheck("<Esc>", "t") ~= "" then
			vim.api.nvim_del_keymap("t", "<Esc>")
		end
	end,
	on_close = function(_)
		-- 添加回来
		vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {
			noremap = true,
			silent = true,
		})
	end,
})

local ta = Terminal:new({
	direction = "float",
	close_on_exit = true,
})

local tb = Terminal:new({
	direction = "vertical",
	close_on_exit = true,
})
local tc = Terminal:new({
	direction = "horizontal",
	close_on_exit = true,
})

local M = {}

M.toggleA = function()
	if ta:is_open() then
		ta:close()
		return
	end
	tb:close()
	tc:close()
	ta:open()
end

M.toggleB = function()
	if tb:is_open() then
		tb:close()
		return
	end
	ta:close()
	tc:close()
	tb:open()
end

M.toggleC = function()
	if tc:is_open() then
		tc:close()
		return
	end
	ta:close()
	tb:close()
	tc:open()
end

M.toggleG = function()
	lazygit:toggle()
end

local mapToggleTerm = function(tt)
	vim.keymap.set({ "n", "t" }, "<leader>ta", tt.toggleA)
	vim.keymap.set({ "n", "t" }, "<leader>ts", tt.toggleB)
	vim.keymap.set({ "n", "t" }, "<leader>td", tt.toggleC)
	vim.keymap.set({ "n", "t" }, "<leader>l", tt.toggleG)
end

mapToggleTerm(M)
