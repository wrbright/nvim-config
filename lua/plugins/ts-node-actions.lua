return {
	'CKolkey/ts-node-action',
	keys = '<C-n>',
	config = function()
		require 'ts-node-action'.setup {}
		vim.keymap.set(
			{ 'n' },
			'<C-n>',
			require 'ts-node-action'.node_action,
			{ desc = 'Trigger Node Action' }
		)
	end
}
