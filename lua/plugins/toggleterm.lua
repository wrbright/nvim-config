return {
	'akinsho/toggleterm.nvim',
	cmd = {
		'LazyGit',
		'LazyDocker',
		'Ctop',
		'Browsh',
		'Gomucks',
		'Ranger'
	},
	config = function()
		require 'toggleterm'.setup {}

		local term = require 'toggleterm.terminal'.Terminal

		local docker_client = term:new {
			cmd = 'lazydocker',
			hidden = true,
			direction = 'float',
			float_opts = {
				border = 'single',
			},
		}
		vim.api.nvim_create_user_command('LazyDocker',
			function()
				docker_client:toggle()
			end, {}
		)

		local ctop_client = term:new {
			cmd = 'ctop',
			hidden = true,
			direction = 'float',
			float_opts = {
				border = 'single',
			},
		}
		vim.api.nvim_create_user_command('Ctop',
			function()
				ctop_client:toggle()
			end, {}
		)

		local btop_client = term:new {
			cmd = 'btop',
			hidden = true,
			direction = 'float',
			float_opts = {
				border = 'single',
			},
		}
		vim.api.nvim_create_user_command('Btop',
			function()
				btop_client:toggle()
			end, {}
		)

		local browsh_client = term:new {
			cmd = 'browsh',
			hidden = true,
			direction = 'float',
			float_opts = {
				border = 'single',
			},
		}
		vim.api.nvim_create_user_command('Browsh',
			function()
				browsh_client:toggle()
			end, {}
		)
		local gomuks_client = term:new {
			cmd = 'gomuks',
			hidden = true,
			direction = 'float',
			float_opts = {
				border = 'single',
			},
		}
		vim.api.nvim_create_user_command('Gomuks',
			function()
				gomuks_client:toggle()
			end, {}
		)
		local ranger_client = term:new {
			cmd = 'ranger',
			hidden = true,
			direction = 'float',
			float_opts = {
				border = 'single',
			},
		}
		vim.api.nvim_create_user_command('Ranger',
			function()
				ranger_client:toggle()
			end, {}
		)
	end
}
