------------------------------------------
-- Lazy.nvim Begin Plugin Configuration --
------------------------------------------
return {
	--Dependency needed for many plugins
	'nvim-lua/plenary.nvim',

	-----------------------------------------------
	-- Text, Text Additions, and Text Formatting --
	-----------------------------------------------

	{ dir='/home/m/openNew/yayb/' },
	{ 'numToStr/Comment.nvim', opts = {}, keys = 'gc' },
	'honza/vim-snippets',
	{ 'machakann/vim-sandwich', keys='s' },
	{ 'vim-scripts/ReplaceWithRegister', keys='grr' },
	'L3MON4D3/LuaSnip',

	-- Nvim cmp add-ins

	{ 'hrsh7th/cmp-nvim-lsp-signature-help', event='LspAttach' },
	{ 'rcarriga/cmp-dap', keys = '<Leader>dd' },
	{
		'saadparwaiz1/cmp_luasnip',
		event = 'InsertEnter',
	},
	----------------------
	-- Additional Panes --
	----------------------

	'kdheepak/lazygit.nvim',
	{  'nvim-treesitter/playground', cmd='TSPlaygroundToggle' },
	{ 'kevinhwang91/rnvimr', cmd='RnvimrToggle' },
	{ 'mbbill/undotree', cmd='UndotreeShow' },
	{ 'preservim/tagbar', keys='<F1>', cmd='TagbarToggle' },

	--Telescope
	{ 'nvim-telescope/telescope.nvim', lazy = false, tag = '0.1.1' },
	-- "Shatur/neovim-session-manager",
	-----------------------------
	-- Alternate Functionality --
	-----------------------------
	-- {
	--   'edluffy/hologram.nvim',
	--   opts = {
	--   auto_display = true
	-- }
	-- },
	-- {
	-- 	'jedrzejboczar/possession.nvim',
	-- 	requires = { 'nvim-lua/plenary.nvim' },
	-- },
	{ 'jedrzejboczar/possession.nvim', requires = 'nvim-lua/plenary.nvim', config = {} },
	'kevinhwang91/nvim-hlslens',
	{ 'tpope/vim-fugitive', event = 'BufEnter' },
	{'lambdalisue/suda.vim', cmd='SudaWrite' },
	{ 'lewis6991/gitsigns.nvim', opts = {} },
	{ 'wesQ3/vim-windowswap', keys='<Leader>ww' },
	-- 'samodostal/image.nvim',

	----------------
	-- aesthetics --
	----------------

	'sainnhe/gruvbox-material',
	{ 'SmiteshP/nvim-navic', requires = 'neovim/nvim-lspconfig', event = 'LspAttach' },
	{ 'Fildo7525/pretty_hover', event = 'LspAttach', opts = {} },
	{ 'onsails/lspkind.nvim', event = 'LspAttach' },
}
