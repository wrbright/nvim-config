-- Disabling netrw (Ex)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath"data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

-- Map the Leader key to <Space>, or ensure it is mapped before Lazy
vim.g.mapleader = ' '

-- require'lazy'.setup'luaConf/plugins/init.lua'
require'lazy'.setup'plugins'

--------------------------------------------------------------------
------------------------ Lua Config Requires------------------------
--------------------------------------------------------------------

require'luaConf/lsp' -- general LSP configuration
require'luaConf/mappings' -- general plugin remappings
require'luaConf/cmpconfig' -- all completion config
require'luaConf/debugging' -- all debugging config
