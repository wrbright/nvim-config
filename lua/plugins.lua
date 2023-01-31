return {
	--Dependency needed for many plugins
	"nvim-lua/plenary.nvim",

	-----------------------------------------------
	-- Text, Text Additions, and Text Formatting --
	-----------------------------------------------

	"honza/vim-snippets",
	"windwp/nvim-autopairs",
	"machakann/vim-sandwich",
	"numToStr/Comment.nvim",
	"vim-scripts/ReplaceWithRegister",
	"L3MON4D3/LuaSnip",
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufEnter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/playground",
			"windwp/nvim-ts-autotag",
			"p00f/nvim-ts-rainbow",
			"CKolkey/ts-node-action",
		},
	},
	--CMP
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
			"rcarriga/cmp-dap",
			"hrsh7th/cmp-nvim-lsp",
			"Saecki/crates.nvim",
			"David-Kunz/cmp-npm",
		},
	},

	----------------------
	-- Additional Panes --
	----------------------

	"mbbill/undotree",
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"preservim/tagbar",
	--Dap
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"kdheepak/lazygit.nvim",
			"mxsdev/nvim-dap-vscode-js",
		},
	},
	--Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-telescope/telescope-project.nvim" },
	},

	-----------------------------
	-- Alternate Functionality --
	-----------------------------

	"tpope/vim-fugitive",
	"lambdalisue/suda.vim",
	"lewis6991/gitsigns.nvim",
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	"kevinhwang91/nvim-hlslens",
	"wesQ3/vim-windowswap",
	"samodostal/image.nvim",
	{
		"princejoogie/chafa.nvim",
		dependencies = { "m00qek/baleia.nvim" },
	},
	"nvim-colortils/colortils.nvim",
	---------
	-- LSP --
	---------

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mfussenegger/nvim-jdtls",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},

	----------------
	-- aesthetics --
	----------------

	"sainnhe/gruvbox-material",
	"nvim-lualine/lualine.nvim",
	{
		"akinsho/bufferline.nvim",
		branch = "v3.*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	"lukas-reineke/indent-blankline.nvim",
	"SmiteshP/nvim-navic",
	"petertriho/nvim-scrollbar",
	"NvChad/nvim-colorizer.lua",
	"onsails/lspkind.nvim",
	"j-hui/fidget.nvim",
}
