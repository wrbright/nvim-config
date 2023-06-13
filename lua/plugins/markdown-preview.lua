return {
	'iamcco/markdown-preview.nvim',
	build = 'cd app && yarn install',
	ft = 'markdown',
	init = function()
		vim.g.mkdp_filetypes = { 'markdown' }
	end,
}
