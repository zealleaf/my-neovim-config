return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "xiyaowong/telescope-emoji.nvim", "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			telescope.load_extension("emoji")

			vim.keymap.set("n", "<leader>tf", function()
				builtin.find_files({
					no_ignore = false,
					hidden = true,
				})
			end)
			vim.keymap.set("n", "<leader>ts", function()
				builtin.live_grep()
			end)
			vim.keymap.set("n", "<leader>tb", function()
				builtin.buffers()
			end)
			vim.keymap.set("n", "<leader>th", function()
				builtin.help_tags()
			end)
			vim.keymap.set("n", "<leader>td", function()
				builtin.diagnostics()
			end)
			vim.keymap.set("n", "<leader>te", ":Telescope emoji<CR>")

			telescope.setup({
				defaults = {
					layout_strategy = "vertical",
					layout_config = {
						vertical = { width = 0.8, height = 0.7 },
						-- other layout configuration here
					},
					file_ignore_patterns = { "node_modules", ".git" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
						},
						n = {
							["q"] = actions.close,
						},
					},
				},
				extensions = {
					emoji = {
						action = function(emoji)
							-- argument emoji is a table.
							-- {name="", value="", cagegory="", description=""}

							vim.fn.setreg("*", emoji.value)
							print([[Press p or "*p to paste this emoji]] .. emoji.value)

							-- insert emoji when picked
							-- vim.api.nvim_put({ emoji.value }, 'c', false, true)
						end,
					},
				},
			})
		end,
	},
}
