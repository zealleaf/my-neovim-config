return {
	-- mason
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim", "jayp0521/mason-null-ls.nvim" },
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"cssls",
					"emmet_ls",
					"html",
					"rust_analyzer",
					"lua_ls",
					"tailwindcss",
					"tsserver",
					"volar",
					"svelte",
					"astro",
				},
				automatic_installation = true,
			})

			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "prettierd", "rustfmt", "eslint_d" },
				automatic_installation = true,
			})
		end,
	},
	-- colors
	{
		"folke/lsp-colors.nvim",
		config = function()
			require("lsp-colors").setup({
				Error = "#db4b4b",
				Warning = "#e0af68",
				Information = "#0db9d7",
				Hint = "#10B981",
			})
		end,
	},
	-- null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				sources = {
					formatting.stylua, -- lua formatter
					formatting.prettierd, -- js/ts formatter
					formatting.rustfmt, -- rust formatter
					formatting.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file({
								".eslintrc",
								".eslintrc.js",
								".eslintrc.cjs",
								".eslintrc.yaml",
								".eslintrc.yml",
								".eslintrc.json",
							})
						end,
					}),
					diagnostics.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file({
								".eslintrc",
								".eslintrc.js",
								".eslintrc.cjs",
								".eslintrc.yaml",
								".eslintrc.yml",
								".eslintrc.json",
							})
						end,
					}),
				},
				on_attach = function(current_client, bufnr)
					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			})
		end,
	},
	-- lspkind
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({
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
		end,
	},
	-- lspsaga
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				ui = {
					winblend = 10,
					border = "rounded",
					colors = {
						normal_bg = "#002b36",
					},
				},
			})
		end,
	},
	-- lsg-config
	{
		"neovim/nvim-lspconfig",
		dependencies = { "jose-elias-alvarez/typescript.nvim", "simrat39/rust-tools.nvim", "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")

			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local typescript = require("typescript")

			local on_attach = function(client, bufnr)
				local opts = {
					noremap = true,
					silent = true,
					buffer = bufnr,
				}

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

			local capabilities = cmp_nvim_lsp.default_capabilities()

			typescript.setup({
				server = {
					capabilities = capabilities,
					on_attach = on_attach,
				},
			})

			lspconfig["astro"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
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
				settings = {
					css = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
					scss = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
					less = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
				filetypes = { "css", "scss", "less", "html", "vue" },
			})

			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = { { "clsx|cva|cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" } },
						},
					},
				},
			})

			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "html" },
			})

			lspconfig["lua_ls"].setup({
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
						checkOnSave = {},
					},
				},
			})

			-- 其他配置
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					update_in_insert = false,
					virtual_text = {
						spacing = 4,
						prefix = "●",
					},
					severity_sort = true,
				})

			local signs = {
				Error = " ",
				Warn = " ",
				Hint = " ",
				Info = " ",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, {
					text = icon,
					texthl = hl,
					numhl = "",
				})
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
		end,
	},
}
