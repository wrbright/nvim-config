return {
	"hrsh7th/nvim-cmp",
	-- Not Actually Dependancies, do not do this
	dependencies = {
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"saadparwaiz1/cmp_luasnip",
		"rcarriga/cmp-dap",
		"hrsh7th/cmp-nvim-lsp",
		"Saecki/crates.nvim",
		"David-Kunz/cmp-npm",
	},
	config = function ()

		-- fixing unpack error detection from mismatched lua versions for internal and external code
		---@diagnostic disable-next-line: deprecated
		table.unpack = table.unpack or unpack

		--------------------------------------------------------------------
		------------------------- Nvim CMP Plugins  ------------------------
		--------------------------------------------------------------------

		require"cmp-npm".setup {}
		require"crates".setup {}

		local cmp = require"cmp"
		local lspkind = require"lspkind"
		local luasnip = require"luasnip"

		--------------------------------------------------------------------
		----------------------------- Nvim CMP  ----------------------------
		--------------------------------------------------------------------

		local has_words_before = function()
			local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup {
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert {
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-c>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-l>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			} ,
			sources = cmp.config.sources {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "npm", keyword_length = 3 },
				{ name = "crates" },
			},
			{
				{ name = "buffer" },
			},
			experimental = {
				ghost_text = true,
			},
			enabled = function()
				return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
			end,
			formatting = {
				format = lspkind.cmp_format {
					mode = "symbol_text", -- show only symbol annotations
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					symbol_map = {},

					-- The function below will be called before any actual modifications from lspkind
					-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
					before = function(_, vim_item)
						return vim_item
					end,
				},
			},
		}

		require"cmp".setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
			sources = {
				{ name = "dap" },
			},
		})

		require"luasnip.loaders.from_snipmate".lazy_load {}
		require"luasnip.loaders.from_vscode".lazy_load { paths = { "~/.config/nvim/snippets/" } }

		-- luasnip.add_snippets = {
		--     all = {
		--
		--     },
		--     c = {
		--         luasnip.parser.parse_snippet("func", "lol" )
		--     }
		-- }

		luasnip.config.set_config {
			history = false,
			updateevents = "TextChanged, TextChangedI",
		}

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" },
				}, {
					{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				}, {
					{ name = "cmdline" },
			}),
		})

	end
}
