return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
	config = function()
		-- vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
		-- vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
		-- vim.keymap.set("n", "<Tab>p", ":BufferLinePick<CR>")
		-- vim.keymap.set("n", "<Tab>c", ":BufferLinePickClose<CR>")
		-- vim.keymap.set("n", "<Tab>l", ":BufferLineCloseRight<CR>")
		-- vim.keymap.set("n", "<Tab>h", ":BufferLineCloseLeft<CR>")
		vim.keymap.set("n", "<Tab>k", ":Bdelete!<CR>")

		require("bufferline").setup({
			options = {
				mode = "tabs",
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
			},
			highlights = {
				separator = {
					fg = "#073642",
					bg = "#002b36",
				},
				separator_selected = {
					fg = "#073642",
				},
				background = {
					fg = "#657b83",
					bg = "#002b36",
				},
				buffer_selected = {
					fg = "#fdf6e3",
					bold = true,
					italic = false,
				},
				fill = {
					bg = "#073642",
				},
			},
		})
	end,
}
