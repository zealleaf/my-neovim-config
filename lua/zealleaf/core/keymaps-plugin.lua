----------------------
-- Plugin Keybinds
----------------------
vim.cmd("autocmd!")
vim.g.mapleader = ";"
local keymap = vim.keymap

-- vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>") -- toggle split window maximization

-- hop
keymap.set("n", "<leader>wi", ":HopPattern<CR>")
keymap.set("n", "<leader>w", ":HopWord<CR>")

-- search and replace
keymap.set("n", "<leader>rr", '<cmd>lua require("spectre").open()<CR>', {
	desc = "Open Spectre",
})
keymap.set("n", "<leader>rw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
keymap.set("v", "<leader>rw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})

keymap.set("v", "<leader>r", '<cmd>lua require("spectre").open_file_search()<CR>', {
	desc = "Search on current file",
})
keymap.set("n", "<leader>r", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

--telescope
keymap.set("n", "<leader>te", ":Telescope emoji<CR>")

--gitsigns
keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>")
keymap.set("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>")
keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")
keymap.set("n", "<leader>gd", "<cmd>GitDiff<CR>")
keymap.set("n", "<leader>gdc", "<cmd>GitDiffClose<CR>")
