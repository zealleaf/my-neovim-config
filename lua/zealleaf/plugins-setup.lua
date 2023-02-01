--[[
-- neovim 插件管理器
--]]

-- 如果没有安装就自动安装
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

local status, packer = pcall(require, "packer")
if not status then
	return
end

-- 插件列表
return packer.startup(function(use)
	-- 包管理器
	use("wbthomason/packer.nvim")

	-- lua函数提供
	use("nvim-lua/plenary.nvim")

	-- 主题
	use("folke/tokyonight.nvim")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	use("EdenEast/nightfox.nvim")
	use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })
	use("navarasu/onedark.nvim")
	use("pineapplegiant/spaceduck")
	use("arcticicestudio/nord-vim")

	-- tmux相关
	use("christoomey/vim-tmux-navigator")

	-- 缩放终端
	use("szw/vim-maximizer")

	-- vim-surround操作
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)

	-- 注释
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- 文件目录树
	use("nvim-tree/nvim-tree.lua")

	-- 各种图标
	use("kyazdani42/nvim-web-devicons")

	-- 各种栏
	use("moll/vim-bbye")
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim")

	-- 浮窗操作
	use({ "nvim-telescope/telescope.nvim" })
	use("nvim-telescope/telescope-file-browser.nvim")
	use("xiyaowong/telescope-emoji.nvim")

	-- 自动完成、提示等
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP

	-- 语言服务协议提供
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("glepnir/lspsaga.nvim") -- enhanced lsp uis
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use("folke/lsp-colors.nvim") -- lsp colors
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("simrat39/rust-tools.nvim") -- Adds extra functionality over rust analyzer

	-- markdown
	use({ "iamcco/markdown-preview.nvim" })

	-- editorconfig
	use("gpanders/editorconfig.nvim")

	-- 代码片段
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- 代码格式化与检查
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters

	-- 代码语法高亮
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({
				with_sync = true,
			})
		end,
	})

	-- 颜色提示
	use("norcalli/nvim-colorizer.lua")

	-- 代码括号操作
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
	})

	-- git整合
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use("dinhhuy258/git.nvim") -- For git blame & browse

	-- vim以及插件命令建议
	use("gelguy/wilder.nvim")

	-- neovim仪表盘
	use("glepnir/dashboard-nvim")
	use("ahmedkhalf/project.nvim")

	-- 切换各个位置的终端
	use("akinsho/toggleterm.nvim")

	-- 快速跳转到指定位置
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({
				keys = "etovxqpdygfblzhckisuran",
			})
		end,
	})

	-- 搜索与替换
	use({ "windwp/nvim-spectre" })

	-- 文件大纲
	use({
		"mxsdev/symbols-outline.nvim",
		branch = "merge-jsx-tree",
	})

	-- 代码、文件折叠与展开
	use({
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
