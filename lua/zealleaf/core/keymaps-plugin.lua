----------------------
-- Plugin Keybinds
----------------------
vim.cmd("autocmd!")
vim.g.mapleader = ";"
local keymap = vim.keymap

-- vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>") -- toggle split window maximization

-- hop
keymap.set("n", "<leader>p", ":HopPattern<CR>")
keymap.set("n", "<leader>w", ":HopWord<CR>")

-- search and replace
keymap.set("n", "<leader>ra", ":lua require('spectre').open()<CR>")
keymap.set("v", "<leader>r", ":lua require('spectre').open_visual({select_word=true})<CR>")
keymap.set("n", "<leader>r", ":lua require('spectre').open_file_search()<CR>")

--telescope
keymap.set("n", "<leader>te", ":Telescope emoji<CR>")
