return {
		"princejoogie/chafa.nvim",
		dependencies = { "m00qek/baleia.nvim" },
		config = {
			render = {
				min_padding = 5,
				show_label = true,
			},
			events = {
				update_on_nvim_resize = true,
			},
		}
	}
