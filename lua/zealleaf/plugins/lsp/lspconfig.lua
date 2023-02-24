--[[
-- 各种语言服务协议的配置与管理
--]]
local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- common
	vim.keymap.set("n", "gh", "<Cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
	vim.keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>", opts)
	vim.keymap.set("n", "gl", ":LspRestart<CR>", opts)
	vim.keymap.set("n", "gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	vim.keymap.set("n", "gs", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

	-- typescript
	if client.name == "tsserver" then
		vim.keymap.set("n", "gtr", ":TypescriptRenameFile<CR>") -- rename file and update imports
		vim.keymap.set("n", "gti", ":TypescriptOrganizeImports<CR>") -- organize imports
		vim.keymap.set("n", "gtu", ":TypescriptRemoveUnused<CR>") -- remove unused variables
	end
end

-- 语言配置
local capabilities = cmp_nvim_lsp.default_capabilities()

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

lspconfig["volar"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["svelte"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html" },
})

lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				-- command = "clippy",
			},
		},
	},
})

-- 其他配置
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always",
	},
})
