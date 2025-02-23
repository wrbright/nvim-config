return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	-- build = function()
	-- 	pcall(require'nvim-treesitter.install'.update{ with_sync = true })
	-- end,
	build = ":TSUpdate",
	config = function()
		require 'nvim-treesitter.configs'.setup {
			highlight = {
				enable = true,
				auto_install = true,
			},
			autotag = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<A-cr>',
					node_incremental = '<A-cr>',
					scope_incremental = 'gti',
					node_decremental = 'gtd',
				},
			},
			refactor = {
				navigation = {
					enable = true,
					keymaps = {
						goto_definition = 'gnd',
						list_definitions = 'gnD',
						list_definitions_toc = 'gO',
						goto_next_usage = '<a-*>',
						goto_previous_usage = '<a-#>',
					},
				},
				smart_rename = {
					enable = true,
					keymaps = {
						smart_rename = '<space>grn',
					},
				},
			},
			indent = {
				enable = true,
			},
			playground = {
				enable = true,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['al'] = '@loop.outer',
						['il'] = '@loop.inner',
						['ac'] = '@comment.outer',
						['ic'] = '@comment.inner',
						['av'] = '@parameter.outer',
						['iv'] = '@parameter.inner',
						['ik'] = '@block.inner',
						['ak'] = '@block.outer',
					},
					selection_modes = {
						['@parameter.outer'] = 'v', -- charwise
						['@function.outer'] = 'V', -- linewise
						['@class.outer'] = '<c-v>', -- blockwise
					},
				},
			},
			rainbow = {
				enable = true,
				-- 	extended_mode = true,
				-- 	max_file_lines = nil,
			},
		}

		local rainbow_delimiters = require 'rainbow-delimiters'

		vim.g.rainbow_delimiters = {
			strategy = {
				[''] = rainbow_delimiters.strategy['global'],
				vim = rainbow_delimiters.strategy['local'],
			},
			query = {
				[''] = 'rainbow-delimiters',
				lua = 'rainbow-blocks',
			},
			highlight = {
				'RainbowDelimiterRed',
				'RainbowDelimiterYellow',
				'RainbowDelimiterBlue',
				'RainbowDelimiterOrange',
				'RainbowDelimiterGreen',
				'RainbowDelimiterViolet',
				'RainbowDelimiterCyan',
			},
			blacklist = {
				"comment"
			}
		}
	end,
	dependencies = {
		'nvim-treesitter/nvim-treesitter-refactor',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'windwp/nvim-ts-autotag',
		{ 'HiPhish/rainbow-delimiters.nvim', branch = 'master' }
	},
}
