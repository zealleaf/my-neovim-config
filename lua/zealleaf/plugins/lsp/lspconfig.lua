local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local status1, typescript = pcall(require, "typescript")
if not status1 then
	return
end

local protocol = require("vim.lsp.protocol")
local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

	-- typescript
	if client.name == "tsserver" then
		vim.keymap.set("n", "gtr", ":TypescriptRenameFile<CR>") -- rename file and update imports
		vim.keymap.set("n", "gti", ":TypescriptOrganizeImports<CR>") -- organize imports
		vim.keymap.set("n", "gtu", ":TypescriptRemoveUnused<CR>") -- remove unused variables
		vim.keymap.set("n", "gto", ":TSLspOrganize<CR>") -- organize
	end
end

protocol.CompletionItemKind = {
	"", -- Text
	"ƒ", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"𝓒", -- Class
	"", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"ℰ", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"𝓢", -- Struct
	"🗲", -- Event
	"", -- Operator
	"𝙏", -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.flow.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

nvim_lsp.sourcekit.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		enable_format_on_save(client, bufnr)
	end,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
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
		source = "always", -- Or "if_many"
	},
})
