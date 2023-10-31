return {
	--[[ -- Basic configuration ]]
	-- mason
	{
		"williamboman/mason.nvim",
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

			local mason_registry = require("mason-registry")

			local list = {
				--lsp
				"astro-language-server",
				"efm",
				"lua-language-server",
				"marksman",
				"rust-analyzer",
				"svelte-language-server",
				"tailwindcss-language-server",
				"typescript-language-server",
				"vue-language-server",

				--lint
				"eslint_d",
				"hadolint",

				--format
				"prettierd", -- prettier for jsx, angular, flow, vue, typescript, css, less, scss, html, json, markdown, yaml
				"stylua",
				"shfmt",
				"clang-format",
				"gofumpt",
				"goimports",
				"black",
				"isort",
			}

			local ensure_installed = function()
				for _, name in pairs(list) do
					if not mason_registry.is_installed(name) then
						local package = mason_registry.get_package(name)
						package:install()
					end
				end
			end

			mason_registry.refresh(vim.schedule_wrap(ensure_installed))
		end,
	},

	-- lsg-config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"pmizio/typescript-tools.nvim",
			"simrat39/rust-tools.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")

			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local typescript_tools = require("typescript-tools")

			local on_attach = function(client, bufnr)
				local opts = {
					noremap = true,
					silent = true,
					buffer = bufnr,
				}

				--[[
        -- common
        --]]
				vim.keymap.set("n", "gf", "<Cmd>Lspsaga finder<CR>", opts)
				vim.keymap.set("n", "gh", "<Cmd>Lspsaga hover_doc<CR>", opts)
				-- vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
				vim.keymap.set("n", "gd", "<c-]>", opts) -- Temporary solution, goto_definition will <c-o> jumping around after use
				vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
				vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
				vim.keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>", opts)
				vim.keymap.set("n", "gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
				vim.keymap.set("n", "gs", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

				--[[
        -- after common <space>
        --]]

				-- comment
				-- link: nvim/lua/zealleaf/plugins/code/comment.lua

				-- toggleterm vertical horizontal
				-- link: nvim/lua/zealleaf/plugins/code/toggleterm.lua

				-- nvimufo
				-- link: nvim/lua/zealleaf/plugins/code/nvimufo.lua

        -- miniindentscope
        -- link: nvim/lua/zealleaf/plugins/code/miniindentscope.lua

				-- tsserver
				if client.name == "typescript-tools" then
					vim.keymap.set("n", "<space>tf", "<Cmd>TSToolsRenameFile<CR>", opts)
					vim.keymap.set("n", "<space>to", "<Cmd>TSToolsOrganizeImports<CR>", opts)
					vim.keymap.set("n", "<space>ta", "<Cmd>TSToolsAddMissingImports<CR>", opts)
					vim.keymap.set("n", "<space>tu", "<Cmd>TSToolsRemoveUnused<CR>", opts)
				end

				-- gitsigns
				vim.keymap.set("n", "<space>gn", "<cmd>Gitsigns next_hunk<CR>")
				vim.keymap.set("n", "<space>gp", "<cmd>Gitsigns prev_hunk<CR>")
				vim.keymap.set("n", "<space>gr", "<cmd>Gitsigns reset_hunk<CR>")
				vim.keymap.set("n", "<space>gd", "<cmd>GitDiff<CR>")
				vim.keymap.set("n", "<space>gdc", "<cmd>GitDiffClose<CR>")

				-- translate
				vim.keymap.set("n", "<space>z", "viw:Translate zh-CN<CR>")
				vim.keymap.set("n", "<space>e", "viw:Translate en -output=replace<CR>")
				vim.keymap.set("v", "<space>z", "<cmd>Translate zh-CN<CR>")
				vim.keymap.set("v", "<space>e", "<cmd>Translate en -output=replace<CR>")

				-- increment/decrement numbers
				vim.keymap.set("n", "<space>a", "<C-a>") -- increment
				vim.keymap.set("n", "<space>x", "<C-x>") -- decrement

				-- format
				vim.keymap.set("n", "<space>f", "", {
					noremap = true,
					silent = true,
					buffer = bufnr,
					callback = function()
						local conform = require("conform")
						conform.format({
							bufnr = bufnr,
							async = false,
							lsp_fallback = true,
						})
					end,
				})

				--[[
        -- after common <leader>
        --]]

				-- telescope
				-- link: nvim/lua/zealleaf/plugins/code/telescope.lua

				-- toggleterm float lazygit
				-- link: nvim/lua/zealleaf/plugins/code/toggleterm.lua

				-- codeium
				vim.keymap.set("i", "<leader>a", function()
					return vim.fn["codeium#Accept"]()
				end, { expr = true })
				vim.keymap.set("i", "<leader>j", function()
					return vim.fn["codeium#CycleCompletions"](1)
				end, { expr = true })
				vim.keymap.set("i", "<leader>k", function()
					return vim.fn["codeium#CycleCompletions"](-1)
				end, { expr = true })
				vim.keymap.set("i", "<leader>c", function()
					return vim.fn["codeium#Clear"]()
				end, { expr = true })
			end

			local capabilities = cmp_nvim_lsp.default_capabilities()

			lspconfig["marksman"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
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

			lspconfig["jsonls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
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
			})

			typescript_tools.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["eslint"].setup({})

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

	-- lspsaga
	{
		"glepnir/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
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

	-- lsp-colors
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

	--[[ Additional configuration ]]
	-- rust
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
}
