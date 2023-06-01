return {
	'petertriho/nvim-scrollbar',
	config = function()
		require('scrollbar').setup({
			excluded_buftypes = {
				'terminal',
				'nofile',
			},
			handle = {
				color = '#54504f',
			},
			marks = {
				Error = { color = '#ff0000' },
				Search = { color = '#ff7700' },
			},
		})

		require'scrollbar.handlers.search'.setup{
			show_current_context = true,
			show_current_context_start = true,
			-- override_lens = function() end, -- use hlslens to place search results in the scrollbar but don't actually enable the plugin

			override_lens = function(render, posList, nearest, idx, relIdx)
				local sfw = vim.v.searchforward == 1
				local indicator, text, chunks
				local absRelIdx = math.abs(relIdx)
				if absRelIdx > 1 then
					indicator = ('%d %s'):format(absRelIdx, sfw ~= (relIdx > 1) and 'N' or 'n')
				elseif absRelIdx == 1 then
					indicator = sfw ~= (relIdx == 1) and 'N' or 'n'
				else
					indicator = ''
				end

				local lnum, col = table.unpack(posList[idx])
				if nearest then
					local cnt = #posList
					if indicator ~= '' then
						text = ('[%s - %d/%d]'):format(indicator, idx, cnt)
					else
						text = ('[%d/%d]'):format(idx, cnt)
					end
					chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLensNear' } }
				else
					text = ('[%s - %d/%d]'):format(indicator, idx, #posList)
					chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLens' } }
				end
				render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
			end,
		}

		require'scrollbar.handlers.gitsigns'.setup{}
	end,
}
