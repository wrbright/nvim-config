return {
	'nvim-lualine/lualine.nvim',
	config = function ()

		-- local navic = require'nvim-navic'

		require'lualine'.setup {
			theme = 'gruvbox',
			options = {
				ignore_focus = { -- lua print(vim.bo.filetype) to print filetype
					'dapui_watches',
					'dapui_stacks',
					'dapui_breakpoints',
					'dapui_scopes',
					'dap-repl',
					'dapui_console',
					'NvimTree',
					'neo-tree',
				}
			},
			sections = {
				lualine_c = {
						"navic"
				},
			},
		}
	end
}
