-- Disabling netrw (Ex)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath'data' .. '/lazy/lazy.nvim'
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

require'lazy'.setup'plugins'

--------------------------------------------------------------------
------------------------ Lua Config Requires------------------------
--------------------------------------------------------------------

require'luaConf/mappings' -- general plugin remappings

--------------------------------------------------------------------
--------------------------- Auto-Commands --------------------------
--------------------------------------------------------------------

vim.api.nvim_create_autocmd('FileType', {
	pattern = {
		'help',
		'startuptime',
		'qf',
		'lspinfo',
		'man',
		'checkhealth'
	},
	command = [[
		nnoremap <buffer><silent> q :close<CR>
		set nobuflisted
	]],
})
