return {
		"akinsho/bufferline.nvim",
		config = {
			options = {
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
			},
		},
		dependencies = "nvim-tree/nvim-web-devicons",
	}
