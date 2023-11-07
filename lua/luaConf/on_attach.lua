local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option( bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc' )

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	-- Goto the declaration under cursor
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)

	-- Goto definition under cursor
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

	-- Open hover menu for word under cursor
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

	-- Open implementations dialog for item under cursor. See all places this has been used
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

	-- Get signature help for item under cursor
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

	-- Add to the workspace folder. This means the LSP will assume this to be part of the current project
	vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)

	-- Add to the workspace folder. This means the LSP will not assume this to be part of the current project
	vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)

	-- List all folders assumed to be a part of the current project by the LSP
	vim.keymap.set('n', '<Leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)

	-- Open dialog with a listing of all type definitions for the item under cursor.
	-- This will show where in code the 'type' is created, what it's implementing, etc.
	-- Essentially, this will show everything which makes up the item under the cursor
	vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)

	-- Find all places the item under the cursor is used
	vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, bufopts)

	-- Rename the item under the cursor the entire project over
	vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)

	-- List all changes suggested by the LSP and optiionally implement them
	vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)

	-- Format the current buffer using whatever LSP is currently attached
	vim.keymap.set('n', '<Leader>fm', function()
		vim.lsp.buf.format { async = true }
	end, bufopts)

	require 'nvim-navic'.attach(client, bufnr)

	-- rebind shift K to pretty hover
	vim.keymap.set('n', 'K', require 'pretty_hover'.hover, bufopts)
end

return on_attach
