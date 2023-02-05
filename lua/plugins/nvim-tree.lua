return {
	"nvim-tree/nvim-tree.lua",
	config = function()

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

		require'nvim-tree'.setup {
			open_on_tab = true,
			sync_root_with_cwd = true,
		}
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
