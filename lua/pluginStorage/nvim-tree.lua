return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local function open_in_default(node)
			-- vim.cmd("!gwenview " .. node.absolute_path .. " &")
			print(node.absolute_path)
			-- open silently
			vim.cmd("!xdg-open " .. node.absolute_path .. " &")
		end

		local function open_nvim_tree(data)
			-- buffer is [No Name]
			local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

			local isDirectory = vim.fn.isdirectory(data.file) == 1

			if not no_name and not isDirectory then
				return
			end

			-- change to the directory
			if isDirectory then
				vim.cmd.cd(data.file)
			end
			require"nvim-tree.api".tree.open()
		end

		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

		require'nvim-tree'.setup {
			open_on_tab = true,
			sync_root_with_cwd = true,
			on_attach = function (bufnr)
				local api = require'nvim-tree.api'

				api.config.mappings.default_on_attach(bufnr)

				vim.keymap.del( 'n', '<C-t>', { buffer = bufnr })
				vim.keymap.set( 'n', '<C-t>', api.tree.toggle)
			end
		}
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
