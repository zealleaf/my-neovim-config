return {
	"akinsho/toggleterm.nvim",
	config = function()
		local toggleterm = require("toggleterm")

		function _G.set_terminal_keymaps()
			local opts = {
				buffer = 0,
			}
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
			open_mapping = [[<leader>t]],
		})

		local Terminal = require("toggleterm.terminal").Terminal

		local lazygit_term = Terminal:new({
			cmd = "lazygit",
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "double",
			},
			on_open = function()
				vim.cmd("startinsert!")
				-- ESC键取消，留给lazygit
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

		---@diagnostic disable-next-line: lowercase-global
		function lazygit_toggle()
			lazygit_term:toggle()
		end

		vim.keymap.set({ "n", "t" }, "<leader>l", "<cmd>lua lazygit_toggle()<CR>")
		vim.keymap.set({ "n", "t" }, "<leader>ta", "<cmd>ToggleTermToggleAll<CR>")
	end,
}
