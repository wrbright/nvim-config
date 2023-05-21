return {
	'akinsho/bufferline.nvim',
	opts = {
		highlights = {
			background = {
				-- bg = '#141414',
				-- fg = '#141414',
			},
		},
		options = {
			diagnostics = 'nvim_lsp',
			offsets = {
				{
					filetype = 'NvimTree',
					text = 'File Explorer',
					text_align = 'left',
					separator = true,
				},
			},
		},
	},
	dependencies = 'nvim-tree/nvim-web-devicons',
}
