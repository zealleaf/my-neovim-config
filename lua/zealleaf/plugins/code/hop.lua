return {
	"phaazon/hop.nvim",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>wi", ":HopPattern<CR>")
		vim.keymap.set("n", "<leader>w", ":HopWord<CR>")

		require("hop").setup()
	end,
}
