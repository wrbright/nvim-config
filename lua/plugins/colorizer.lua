return {
		"NvChad/nvim-colorizer.lua",
		event = "BufEnter",
		config = {
			filetypes = { "*", "!lua" }, -- disable colorizer for lua
			user_default_options = { mode = "virtualtext" },
		}
	}
