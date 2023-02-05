return {
	"petertriho/nvim-scrollbar",
	config = function ()
		require'scrollbar'.setup {
			excluded_buftypes = {
				"terminal",
				"nofile",
			},
			handle = {
				color = "#54504f",
			},
			marks = {
				Error = { color = "#ff0000" },
				Search = { color = "#ff7700" },
			},
		}

		require'scrollbar.handlers.search'.setup {
			show_current_context = true,
			show_current_context_start = true,
			override_lens = function() end, -- use hlslens to place search results in the scrollbar but don't actually enable the plugin
		}

		require"scrollbar.handlers.gitsigns".setup {}
	end
}
