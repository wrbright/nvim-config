return {
	'bennypowers/nvim-regexplainer',
	keys = '<Leader>re',
	config = function()
		require 'regexplainer'.setup {
			-- 'narrative'
			mode = 'narrative', -- TODO: 'ascii', 'graphical'

			-- automatically show the explainer when the cursor enters a regexp
			auto = false,

			-- filetypes (i.e. extensions) in which to run the autocommand
			filetypes = {
				'html',
				'js',
				'cjs',
				'mjs',
				'ts',
				'jsx',
				'tsx',
				'cjsx',
				'mjsx',
			},

			-- Whether to log debug messages
			debug = false,

			-- 'split', 'popup'
			display = 'popup',

			mappings = {
				toggle = '<Leader>re',
				-- examples, not defaults:
				-- show = 'gS',
				-- hide = 'gH',
				-- show_split = 'gP',
				-- show_popup = 'gU',
			},

			narrative = {
				separator = '\n',
			},
		}
	end,
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'MunifTanjim/nui.nvim', },
}
