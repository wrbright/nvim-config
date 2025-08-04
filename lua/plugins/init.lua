------------------------------------------
-- Lazy.nvim Begin Plugin Configuration --
------------------------------------------
return {
	-----------------------------------------------
	-- Text, Text Additions, and Text Formatting --
	-----------------------------------------------
	-- { dir = '/home/m/openNew/yayb/' },
	{ 'chaoren/vim-wordmotion',              event = 'BufEnter' },
	{ 'honza/vim-snippets' },
	{ 'machakann/vim-sandwich',              keys = 's' },
	{ 'vim-scripts/ReplaceWithRegister',     keys = 'grr' },
	{ 'L3MON4D3/LuaSnip' },

	-- Nvim cmp add-ins

	{ 'hrsh7th/cmp-nvim-lsp-signature-help', event = 'LspAttach' },
	{ 'rcarriga/cmp-dap',                    keys = '<Leader>dd' },
	{ 'saadparwaiz1/cmp_luasnip',            event = 'InsertEnter', },
	----------------------
	-- Additional Panes --
	----------------------
	{ 'kdheepak/lazygit.nvim',               cmd = "LazyGit" },
	-- {  'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
	{ 'kevinhwang91/rnvimr',                 cmd = 'RnvimrToggle' },
	{ 'mbbill/undotree',                     cmd = 'UndotreeShow' },
	-- { 'preservim/tagbar', keys = '<F1>', cmd = 'TagbarToggle' },

	----------------------------
	-- Alternate Functionality --
	-----------------------------
	-- { 'edluffy/hologram.nvim',               opts = { auto_display = true } },
	{ 'williamboman/mason-lspconfig.nvim',   opts = {} },
	{ 'mfussenegger/nvim-jdtls',             ft = 'java' },
	{ 'kevinhwang91/nvim-hlslens' },
	{ 'jedrzejboczar/possession.nvim',       requires = 'nvim-lua/plenary.nvim', opts = {} },
	{ 'saecki/crates.nvim',                  event = { 'BufRead Cargo.toml' },   opts = {} },
	{ 'tpope/vim-fugitive',                  event = 'BufEnter' },
	{ 'lambdalisue/suda.vim',                cmd = 'SudaWrite' },
	{ 'lewis6991/gitsigns.nvim',             opts = {} },
	{ 'wesQ3/vim-windowswap',                keys = '<Leader>ww' },
	{ "mrbjarksen/neo-tree-diagnostics.nvim" },
	{
		"m4xshen/hardtime.nvim",
		cmd = 'Hardtime enable',
		opts = {},
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" }
	},

	----------------
	-- Aesthetics --
	----------------
	{ 'sainnhe/gruvbox-material' },
	{ 'SmiteshP/nvim-navic',     requires = 'neovim/nvim-lspconfig', event = 'LspAttach' },
	{ 'Fildo7525/pretty_hover',  event = 'LspAttach',                opts = {} },
	{ 'onsails/lspkind.nvim',    event = 'LspAttach' },
}
