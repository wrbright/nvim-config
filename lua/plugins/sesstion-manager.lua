return {
  "Shatur/neovim-session-manager" ,
  config = function ()
		local config_group = vim.api.nvim_create_augroup('OpenTreeOnLoadSession', {})

		vim.api.nvim_create_autocmd({ 'User' }, {
		  pattern = "SessionLoadPost",
				group = config_group,
				callback = function()
						require'neo-tree.command'.execute { action = 'show' }
				end,
		})

		require'session_manager'.setup {}
		end
}

