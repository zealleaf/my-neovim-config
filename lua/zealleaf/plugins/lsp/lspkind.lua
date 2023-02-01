--[[
-- 图标
--]]
local status, lspkind = pcall(require, "lspkind")
if not status then
	return
end

lspkind.init({
	mode = "symbol",
	preset = "codicons",
	symbol_map = {
		Text = "",
		Method = "ƒ",
		Function = "",
		Constructor = "",
		Field = "",
		Variable = "",
		Class = "𝓒",
		Interface = "ﰮ",
		Module = "",
		Property = "",
		Unit = "",
		Value = "",
		Enum = "ℰ",
		Keyword = "",
		Snippet = "﬌",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "𝓢",
		Event = "🗲",
		Operator = "",
		TypeParameter = "𝙏",
	},
})
