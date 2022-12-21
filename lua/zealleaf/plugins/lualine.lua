-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	theme = "tokyonight", -- "catppuccin"
})
