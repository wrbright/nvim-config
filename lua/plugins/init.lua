------------------------------------------
-- Lazy.nvim Begin Plugin Configuration --
------------------------------------------
return {
	--Dependency needed for many plugins
	'nvim-lua/plenary.nvim',

	-----------------------------------------------
	-- Text, Text Additions, and Text Formatting --
	-----------------------------------------------

	{dir='/home/m/openNew/yayb/'},
	'honza/vim-snippets',
	{'machakann/vim-sandwich', keys='s'},
	{'vim-scripts/ReplaceWithRegister', keys='grr'},
	'L3MON4D3/LuaSnip',

	----------------------
	-- Additional Panes --
	----------------------

	{'nvim-treesitter/playground', cmd='TSPlaygroundToggle'},
	{'kevinhwang91/rnvimr', cmd='RnvimrToggle'},
	{'mbbill/undotree', cmd='UndotreeShow'},
	{'preservim/tagbar', keys='<F1>', cmd='TagbarToggle'},
	{
		'CKolkey/ts-node-action',
		keys='<C-n>',
		config = function ()
			require'ts-node-action'.setup {}
			vim.keymap.set(
				{ 'n' },
				'<C-n>',
				require'ts-node-action'.node_action,
				{ desc = 'Trigger Node Action' }
			)
		end
	},

	--Telescope
	{
		'nvim-telescope/telescope.nvim',
		-- cmd='Telescope',
		lazy = false,
		-- init= function ()
		-- 	require'telescope'.load_extension('project');
		-- end

	},
	-----------------------------
	-- Alternate Functionality --
	-----------------------------
	-- {
	-- 'edluffy/hologram.nvim',
	-- opts = {
	-- auto_display = true
	-- }
	-- },
	{
		'jedrzejboczar/possession.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
	},
	{
		'tpope/vim-fugitive',
		-- cond=function()
		-- 	local isGit = vim.fn.system('isGit.sh') == 'true\n';
		-- 	return isGit;
		-- end
	},
	{'lambdalisue/suda.vim', cmd='SudaWrite'},
	{ 'lewis6991/gitsigns.nvim', opts = {} },
	{
		'iamcco/markdown-preview.nvim',
		build = 'cd app && yarn install',
		cmd='MarkdownPreview',
		init = function ()
			vim.g.mkdp_filetypes = { 'markdown' }
		end,
	},
	'kevinhwang91/nvim-hlslens',
	{'wesQ3/vim-windowswap', keys='<Leader>ww'},
	'samodostal/image.nvim',

	----------------
	-- aesthetics --
	----------------

	{
		'SmiteshP/nvim-navic',
		requires='neovim/nvim-lspconfig',
		event = 'LspAttach',
	},
	{ "Fildo7525/pretty_hover", event = "LspAttach", opts = {} },
	'sainnhe/gruvbox-material',
	{ 'onsails/lspkind.nvim', event = 'LspAttach' },
	{ 'j-hui/fidget.nvim', event = 'LspAttach' },
}
