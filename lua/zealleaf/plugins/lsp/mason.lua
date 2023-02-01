--[[
-- 各种语言服务协议、lint以及格式化工具等等的下载与管理
--]]
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"cssls",
		"emmet_ls",
		"html",
		"rust_analyzer",
		"sumneko_lua",
		"tailwindcss",
		"tsserver",
		"volar",
	},
	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = {
		"stylua",
		"prettierd",
		"eslint_d",
	},
	automatic_installation = true,
})
