--------------------------------------------------------------------
--------------------------- Plugin Setup----------------------------
--------------------------------------------------------------------
require"nvim-treesitter.configs".setup {
	highlight = {
		enable = true,
		auto_install = true,
	},
	autotag = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<A-cr>",
			node_incremental = "<A-cr>",
			scope_incremental = "gts",
			node_decremental = "gtd",
		},
	},
	refactor = {
		navigation = {
			enable = true,
			keymaps = {
				-- goto_definition = "gnd",
				-- list_definitions = "gnD",
				-- list_definitions_toc = "gO",
				goto_next_usage = "<a-*>",
				goto_previous_usage = "<a-#>",
			},
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "<space>grr",
			},
		},
	},
	indent = {
		enable = true,
	},
	playground = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ac"] = "@comment.outer",
				["ic"] = "@comment.inner",
				["av"] = "@parameter.outer",
				["iv"] = "@parameter.inner",
				["ik"] = "@block.inner",
				["ak"] = "@block.outer",
			},
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
}
vim.keymap.set({ "n" }, "<C-n>", require"ts-node-action".node_action, { desc = "Trigger Node Action" })

require"colortils".setup {
	-- register to store color value
	register = "c",
	border = "single",
}

require"colorizer".setup {
	filetypes = { "*", "!lua" }, -- disable colorizer for lua
	user_default_options = { mode = "virtualtext" },
}

require"chafa".setup {
	render = {
		min_padding = 5,
		show_label = true,
	},
	events = {
		update_on_nvim_resize = true,
	},
}
-- require'image'.setup {
--     render = {
--         min_padding = 5,
--         show_label = true,
--         use_dither = true,
--         foreground_color = true,
--         background_color = true
--     },
--     events = {
--         update_on_nvim_resize = true,
--     },
-- }

require"nvim-autopairs".setup {
	enable_check_bracket_line = false,
}

require"bufferline".setup {
	options = {
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
}

local navic = require"nvim-navic"

require"lualine".setup {
	theme = "gruvbox",
	sections = {
		lualine_c = {
			{ navic.get_location, cond = navic.is_available },
		},
	},
}

require"scrollbar".setup {
	excluded_buftypes = {
		"terminal",
		"nofile",
	},
	handle = {
		color = "#54504f",
	},
	marks = {
		Error = { color = "#ff0000" },
		Search = { color = "#ff7700" },
	},
}
require"scrollbar.handlers.gitsigns".setup {}

-- require"scrollbar.handlers.search".setup {
--     override_lens = function end,
-- }

require"indent_blankline".setup {
	show_current_context = true,
	show_current_context_start = true,
}

-- local function open_in_gwenview(node)
--     -- open gwenview silently
--       print(node.absolute_path)
--     -- vim.cmd("!gwenview " .. node.absolute_path .. " &")
--     vim.cmd("!xdg-open " .. node.absolute_path .. " &")
-- end

local function open_nvim_tree(data)
	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end
	require"nvim-tree.api".tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
require"nvim-tree".setup {
	-- view = {
	--     mappings = {
	--         list = {
	--             { key = "i", action = "Open In Qwenview", action_cb = open_in_gwenview },
	--         }
	--     }
	-- },
	-- on_start = {
	--     open = {
	--         always = true,
	--         directory = true,
	--         unnamed = true,
	--         empty = true,
	--         file = true,
	--     },
	--     focus_tree = {
	--         always = false,
	--         unnamed = true,
	--         empty = true,
	--         file = false,
	--     },
	-- },
	open_on_tab = true,
	-- focus_empty_on_setup = true,
	sync_root_with_cwd = true,
}

require"scrollbar.handlers.search".setup {
	override_lens = function() end, -- use hlslens to place search results in the scrollbar but don't actually enable the plugin
}

-- -- hlslens function (if you want to enable HlSearchLens)
-- require'scrollbar.handlers.search'.setup {
--     override_lens = function(render, posList, nearest, idx, relIdx)
--         local sfw = vim.v.searchforward == 1
--         local indicator, text, chunks
--         local absRelIdx = math.abs(relIdx)
--         if absRelIdx > 1 then
--             indicator = ('%d%s'):format(absRelIdx, sfw ~= (relIdx > 1) and '▲' or '▼')
--         elseif absRelIdx == 1 then
--             indicator = sfw ~= (relIdx == 1) and '▲' or '▼'
--         else
--             indicator = ''
--         end
--
--         local lnum, col = table.unpack(posList[idx])
--         if nearest then
--             local cnt = #posList
--             if indicator ~= '' then
--                 text = ('%s [%d/%d]'):format(indicator, idx, cnt)
--             else
--                 text = ('[%d/%d]'):format(idx, cnt)
--             end
--             chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLensNear' } }
--         else
--             text = ('%s [%d/%d]'):format(indicator, idx, #posList)
--             chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLens' } }
--         end
--         render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
--     end,
-- }

require"gitsigns".setup{}

require"Comment".setup{}

require"telescope".setup{}
require"telescope".load_extension"project" -- currently broken unless inside a TTY session without a desktop environment
