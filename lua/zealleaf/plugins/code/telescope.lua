return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "xiyaowong/telescope-emoji.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			telescope.load_extension("emoji")

			vim.keymap.set("n", "<leader>f", function()
				builtin.find_files({
					no_ignore = false,
					hidden = true,
				})
			end)
			vim.keymap.set("n", "<leader>s", function()
				builtin.live_grep()
			end)
			vim.keymap.set("n", "<leader>b", function()
				builtin.buffers()
			end)
			vim.keymap.set("n", "<leader>h", function()
				builtin.help_tags()
			end)
			vim.keymap.set("n", "<leader>d", function()
				builtin.diagnostics()
			end)
			vim.keymap.set("n", "<leader>te", ":Telescope emoji<CR>")

			telescope.setup({
				defaults = {
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
