return {
	'stevearc/oil.nvim',
	opts = {},
	config = function ()
		require'oil'.setup{
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			default_file_explorer = false,
			delete_to_trash = true,
			view_options = {
				show_hidden = false,
			}
		}

	end
}
