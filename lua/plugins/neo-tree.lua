return {
	'nvim-neo-tree/neo-tree.nvim',
	config = function()
		-- vim.api.nvim_create_autocmd( 'BufEnter' , {
		-- 	callback = function(args)
		-- 		if vim.api.nvim_buf_get_name(args.buf) == '' then
		-- 			vim.cmd'NeoTreeReveal'
		-- 		end
		-- 	end,
		-- })

		local delete = function(state)
			local inputs = require 'neo-tree.ui.inputs'
			local path = state.tree:get_node().path
			inputs.confirm('Are you sure you want to trash ' .. path, function(confirmed)
				if not confirmed then
					return
				end

				vim.fn.system { 'trash', vim.fn.fnameescape(path) }

				require 'neo-tree.sources.manager'.refresh(state.name)
			end)
		end

		-- over write default 'delete_visual' command to 'trash' x n.
		local delete_visual = function(state, selected_nodes)
			local inputs = require 'neo-tree.ui.inputs'

			-- get table items count
			function GetTableLen(tbl)
				local len = 0
				for _ in pairs(tbl) do
					len = len + 1
				end
				return len
			end

			local count = GetTableLen(selected_nodes)
			local msg = 'Are you sure you want to trash ' .. count .. ' files ?'
			inputs.confirm(msg, function(confirmed)
				if not confirmed then
					return
				end
				for _, node in ipairs(selected_nodes) do
					vim.fn.system { 'trash', vim.fn.fnameescape(node.path) }
				end
				require 'neo-tree.sources.manager'.refresh(state.name)
			end)
		end

		local function open_in_default(state)
			local node = state.tree:get_node();
			-- vim.cmd('!gwenview ' .. node.absolute_path .. ' &')
			print(node.absolute_path)
			-- open silently
			vim.cmd('!xdg-open \"' .. node.path .. '\" &')
		end

		require 'neo-tree'.setup {
			sources = {
				'filesystem',
				'buffers',
				'document_symbols',
				'diagnostics',
			},
			source_selector = {
				winbar = true,
				statusline = false,
			},
			window = {
				mappings = {
					['P'] = { 'toggle_preview', config = {
						use_float = true,
						use_image_nvim = true
					} },
					['K'] = { command = "image_wezterm" },
					['o'] = { command = open_in_default },
					['/'] = {},
					['q'] = {}
				}
			},
			filesystem = {
				follow_current_file = {
					enabled = true
				},
				commands = {
					image_wezterm = function(state)
						local node = state.tree:get_node()
						if node.type == "file" then
							require("image_preview").PreviewImage(node.path)
						end
					end,
					delete = delete,
					delete_visual = delete_visual,
				},
			},
			enable_modified_markers = true,
			enable_git_status = true,
		}
	end,
	dependencies = {
		'3rd/image.nvim',
		'MunifTanjim/nui.nvim'
	},
}
