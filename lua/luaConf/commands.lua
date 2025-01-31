-- When the filetype is improperly detected, fix the issue and restart the LSP
vim.api.nvim_create_user_command('HeaderC', 'set filetype=c | LspRestart', {})
vim.api.nvim_create_user_command('HeaderCpp', 'set filetype=cpp | LspRestart', {})
vim.api.nvim_create_user_command('Cr', 'Cargo run', {})
