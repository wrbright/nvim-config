---------------------------------------------------------------------
-------------------------- Plugin Mappings --------------------------
---------------------------------------------------------------------
local lspOpts = { noremap = true, silent = true }

-- Remapping search to hlslens search functions in order to highlight in the scrollbar
-- This plugin is otherwise disabled
vim.api.nvim_set_keymap(
	"n",
	"n",
	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	lspOpts
)
vim.api.nvim_set_keymap(
	"n",
	"N",
	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	lspOpts
)
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], lspOpts)
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], lspOpts)
vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], lspOpts)
vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], lspOpts)

-- vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)

--[[
Auto move mappings over from vim file.
New (must include newline): "zxdw"cdf "vd$dd`F :copy .
f'"zp;;"cpx;"vp`G
old (requires personal remappings): "zxdw"cdf "vd$dd`F üJf'"zp;;"cpx;"vp`G
--]]

-- Place Maker G ["G] on your top vimscript mapping and Marker F ["F] over the lua code snippet below then run from vimscript
-- quotations must be fixed. Will flip input line order.
-- uncomment and place marker
-- vim.api.nvim_set_keymap('', '', '', plugOpts)
local plugOpts = { noremap = true, silent = true }

-- Does not work
vim.api.nvim_set_keymap("v", "<C-<Bslash>>", "gc", plugOpts)
-- vim.api.nvim_set_keymap('v', "<C-_>", 'gc', plugOpts)
-- Does not work
vim.api.nvim_set_keymap("n", "<C-Bslash>", "gcc", plugOpts)

vim.api.nvim_set_keymap("n", "<C-t>", ":NeoTreeShowToggle<CR>", plugOpts)
vim.api.nvim_set_keymap("n", "<Leader>t", ":NeoTreeFloatToggle<CR>", plugOpts)

vim.api.nvim_set_keymap("n", "<Leader>rr", ":RnvimrToggle<CR>", plugOpts)

vim.api.nvim_set_keymap("n", "<F1>", ":TagbarToggle<CR>", plugOpts)
vim.api.nvim_set_keymap("n", "<F2>", ":LazyGit<CR>", plugOpts)
vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dapui'.toggle()<cr>", plugOpts)

vim.api.nvim_set_keymap("n", "<A-g>N", ":Gitsigns prev_hunk<CR>", plugOpts)
vim.api.nvim_set_keymap("n", "<A-g>n", ":Gitsigns next_hunk<CR>", plugOpts)
vim.api.nvim_set_keymap("n", "<A-g>", ":Gitsigns preview_hunk<CR>", plugOpts)

vim.api.nvim_set_keymap("n", "<Leader>x", ":BufferLinePickClose<cr>", plugOpts)
vim.api.nvim_set_keymap("n", "<Leader>b", ":BufferLinePick<cr>", plugOpts);
vim.api.nvim_set_keymap("n", "<Leader>l", ":BufferLineCycleNex<cr>", plugOpts)
vim.api.nvim_set_keymap("n", "<Leader>h", ":BufferLineCyclePrev<cr>", plugOpts)

vim.api.nvim_set_keymap("n", "<C-z>", ":Telescope live_grep<CR>", plugOpts)
vim.api.nvim_set_keymap("n", "<Leader>rs", "<cmd>Telescope resume<cr>", plugOpts)
vim.api.nvim_set_keymap("n", "<Leader>m", "<cmd>Telescope marks<cr>", plugOpts)
vim.api.nvim_set_keymap("n", "<Leader>gf", "<cmd>Telescope live_grep<cr>", plugOpts)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>gb",
	":lua require('telescope.builtin').live_grep({prompt_title = 'find string in open buffers', grep_open_files=true})<cr>"
	,
	plugOpts
)
vim.api.nvim_set_keymap("n", "<Leader>f", "<cmd>Telescope find_files<cr>", plugOpts)
vim.api.nvim_set_keymap("n", "<Leader>fb", "<cmd>Telescope buffers<cr><Esc>", plugOpts)
