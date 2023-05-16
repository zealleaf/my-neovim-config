local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

-- local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	-- configure custom mappings
	defaults = {
		file_ignore_patterns = { "node_modules", ".git" },
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				-- ["<C-q>"] = actions.close,
			},
			n = {
				-- ["<C-k>"] = actions.move_selection_previous, -- move to prev result
				-- ["<C-j>"] = actions.move_selection_next, -- move to next result
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			-- mappings = {
			-- 	-- your custom insert mode mappings
			-- 	["i"] = {
			-- 		["<C-k>"] = actions.move_selection_previous, -- move to prev result
			-- 		["<C-j>"] = actions.move_selection_next, -- move to next result
			-- 		["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			-- 		["<C-w>"] = function()
			-- 			vim.cmd("normal vbd")
			-- 		end, -- clear
			-- 	},
			-- 	["n"] = {
			-- 		["a"] = fb_actions.create,
			-- 		["h"] = fb_actions.goto_parent_dir,
			-- 		["/"] = function()
			-- 			vim.cmd("startinsert")
			-- 		end,
			-- 	},
			-- },
		},
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

telescope.load_extension("file_browser")
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
-- vim.keymap.set("n", "<leader>r", function()
-- 	builtin.resume()
-- end)
vim.keymap.set("n", "<leader>d", function()
	builtin.diagnostics()
end)

vim.keymap.set("n", "<leader>te", ":Telescope emoji<CR>")

-- vim.keymap.set("n", "<leader>b", function()
-- 	telescope.extensions.file_browser.file_browser({
-- 		path = "%:p:h",
-- 		cwd = telescope_buffer_dir(),
-- 		respect_gitignore = false,
-- 		hidden = true,
-- 		grouped = true,
-- 		previewer = false,
-- 		initial_mode = "normal",
-- 		layout_config = {
-- 			height = 40,
-- 		},
-- 	})
-- end)
