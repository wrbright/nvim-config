return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	event = 'BufRead',
	build = function()
		pcall(require'nvim-treesitter.install'.update{ with_sync = true })
	end,
	config = function ()
		require'nvim-treesitter.configs'.setup {
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
					scope_incremental = 'gts',
					node_decremental = 'gtd',
				},
			},
			refactor = {
				navigation = {
					enable = true,
					keymaps = {
						-- goto_definition = 'gnd',
						-- list_definitions = 'gnD',
						-- list_definitions_toc = 'gO',
						goto_next_usage = '<a-*>',
						goto_previous_usage = '<a-#>',
					},
				},
				smart_rename = {
					enable = true,
					keymaps = {
						smart_rename = '<space>grr',
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
				extended_mode = true,
				max_file_lines = nil,
			},
		}
	end,
	dependencies = {
		'nvim-treesitter/nvim-treesitter-refactor',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'windwp/nvim-ts-autotag',
		'p00f/nvim-ts-rainbow',
	},
}
