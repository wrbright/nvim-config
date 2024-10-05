-- Disabling netrw (Ex)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1


local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

-- Map the Leader key to <Space>, or ensure it is mapped before Lazy
vim.g.mapleader = ' '

require 'lazy'.setup('plugins', {
	ui = {
		border = "single"
	}
})

--------------------------------------------------------------------
------------------------ Lua Config Requires------------------------
--------------------------------------------------------------------

require 'luaConf/mappings' -- general plugin remappings
require 'luaConf/commands' -- user defined commands using plugins

--------------------------------------------------------------------
---------------------------- Aesthetics  ---------------------------
--------------------------------------------------------------------

-- Set background of floating window and it's border to transparent
local set_hl_for_floating_window = function()
	vim.api.nvim_set_hl(0, 'NormalFloat', {
		link = 'Normal',
	})
	vim.api.nvim_set_hl(0, 'FloatBorder', {
		bg = 'none',
	})
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = '*',
	desc = 'Avoid overwritten by loading color schemes later',
	callback = set_hl_for_floating_window,
})

--------------------------------------------------------------------
--------------------------- Auto-Commands --------------------------
--------------------------------------------------------------------

-- Inside these filetypes, bind q to :close. When inside them press q to quit the buffer
vim.api.nvim_create_autocmd('FileType', {
	-- Find Filetype With :lua print(vim.bo.filetype)
	pattern = {
		'help',
		'qf',
		'lspinfo',
		'man',
		'checkhealth',
		'oil',
		'neo-tree-popup',
		'TelescopePrompt',
	},
	command = [[
		nnoremap <buffer> q :q!<CR>
		set nobuflisted
	]],
})
