--[[
-- 输入提示UI
-- 自动补全提示框配置
--]]
local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	definition = {
		edit = "<CR>",
	},
	ui = {
		winblend = 10,
		border = "rounded",
		colors = {
			normal_bg = "#002b36",
		},
	},
})
