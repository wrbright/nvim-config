------------------------------------------
-- Lazy.nvim Begin Plugin Configuration --
------------------------------------------

local function is_git_repo()
end

return {
	--Dependency needed for many plugins
	'nvim-lua/plenary.nvim',

	-----------------------------------------------
	-- Text, Text Additions, and Text Formatting --
	-----------------------------------------------

	'honza/vim-snippets',
	'machakann/vim-sandwich',
	{'vim-scripts/ReplaceWithRegister', keys='grr'},
	'L3MON4D3/LuaSnip',
	--CMP
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'saadparwaiz1/cmp_luasnip',
			'rcarriga/cmp-dap',
			'hrsh7th/cmp-nvim-lsp',
			'Saecki/crates.nvim',
			'David-Kunz/cmp-npm',
		},
	},

	----------------------
	-- Additional Panes --
	----------------------

	{'kevinhwang91/rnvimr', cmd='RnvimrToggle'},
	{'mbbill/undotree', cmd='UndotreeShow'},
	{'preservim/tagbar', keys='<F1>', cmd='TagbarToggle'},

	--Telescope
	'nvim-telescope/telescope.nvim',

	-----------------------------
	-- Alternate Functionality --
	-----------------------------

	{
		'tpope/vim-fugitive',
		cond=function()
			local isGit = vim.fn.system("isGit.sh") == 'true\n';
			return isGit;
		end
	},
	'lambdalisue/suda.vim',
	'lewis6991/gitsigns.nvim',
	{
		'iamcco/markdown-preview.nvim',
		build = 'cd app && yarn install',
		cmd='MarkdownPreview',
		init = function()
			vim.g.mkdp_filetypes = { 'markdown' }
		end,
	},
	'kevinhwang91/nvim-hlslens',
	{'wesQ3/vim-windowswap', keys='<Leader>ww'},
	'samodostal/image.nvim',
	----------------
	-- aesthetics --
	----------------
	{ 'SmiteshP/nvim-navic', requires='neovim/nvim-lspconfig', event = 'LspAttach',  },

	'sainnhe/gruvbox-material',
	{ 'onsails/lspkind.nvim', event = 'LspAttach' },
	{ 'j-hui/fidget.nvim', event = 'LspAttach' },
}
