return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
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
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.3
				end
			end,
			open_mapping = [[<leader><space>t]],
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

		local float_term = Terminal:new({
			direction = "float",
			close_on_exit = true,
		})

		local vertical_term = Terminal:new({
			direction = "vertical",
			close_on_exit = true,
		})

		local horizontal_term = Terminal:new({
			direction = "horizontal",
			close_on_exit = true,
		})

		local term_map = {}

		term_map.toggle_float_term = function()
			if float_term:is_open() then
				float_term:close()
				return
			end
			vertical_term:close()
			horizontal_term:close()
			float_term:open()
		end

		term_map.toggle_vertical_term = function()
			if vertical_term:is_open() then
				vertical_term:close()
				return
			end
			float_term:close()
			horizontal_term:close()
			vertical_term:open()
		end

		term_map.toggle_horizontal_term = function()
			if horizontal_term:is_open() then
				horizontal_term:close()
				return
			end
			float_term:close()
			vertical_term:close()
			horizontal_term:open()
		end

		term_map.toggle_lazygit_term = function()
			lazygit_term:toggle()
		end

		local mapToggleTerm = function(termMap)
			vim.keymap.set({ "n" }, "<space>v", termMap.toggle_vertical_term)
			vim.keymap.set({ "n" }, "<space>h", termMap.toggle_horizontal_term)
			vim.keymap.set({ "n", "t" }, "<leader>f", termMap.toggle_float_term)
			vim.keymap.set({ "n", "t" }, "<leader>l", termMap.toggle_lazygit_term)
		end

		mapToggleTerm(term_map)
	end,
}
