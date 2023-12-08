return {
	"niuiic/remote.nvim",
	dependencies = "niuiic/core.nvim",
	opts = {
		config_file = "~/.config/nvim/remote.json",
		log_file = "~/.config/nvim/remote.log",
		unmount = function(path)
			return "umount " .. path
		end,
		disconnect_on_leave = true,
		on_each_to_connect = function() end,
		on_each_connected = function() end,
		on_each_to_disconnect = function() end,
		on_each_disconnected = function() end,
	},
}
