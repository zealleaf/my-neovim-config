local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("没有找到 bufferline")
	return
end

-- bufferline 配置
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
	options = {
		close_icon = "",
		-- 关闭 Tab 的命令, moll/vim-bbye 的 :Bdelete 命令
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		-- 侧边栏配置
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
		diagnostics = "nvim_lsp",
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "   " or (e == "warning" and "   " or "  ")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
