return {
	'neovim/nvim-lspconfig',
	config = function()
		--------------------------------------------------------------------
		---------------------------- lsp Plugins ---------------------------
		--------------------------------------------------------------------

		require 'fidget'.setup {}

		--------------------------------------------------------------------
		---------------------------- LSP config ----------------------------
		--------------------------------------------------------------------


		require('lspconfig.ui.windows').default_options = {
			border = "single"
		}

		-- Mapping new bindings that do not conflict with any current mappings
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		local opts = { noremap = true, silent = true }
		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '<space>[', vim.diagnostic.goto_prev, opts)
		vim.keymap.set('n', '<space>]', vim.diagnostic.goto_next, opts)
		vim.keymap.set('n', '<space>q', vim.diagnostic.setqflist, opts)

		-- Mappings, includes, etc. that must only be set when the LSP Client has been attached
		local on_attach = require 'luaConf/on_attach'
		local on_attach_clean = require 'luaConf/on_attach-clean'

		-- Set up lspconfig.
		local capabilities = require 'cmp_nvim_lsp'.default_capabilities {}

		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true
		}

		local lsp_flags = {
			debounce_text_changes = 100,
		}

		require 'lspconfig'.lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				},
			},
		}

		-- require'lspconfig'.ccls.setup {
		-- on_attach = on_attach,
		-- capabilities = capabilities,
		--     init_options = {
		--         compilationDatabaseDirectory = 'build'
		--         index = {
		--             threads = 0
		--         }
		--         clang = {
		--             excludeArgs = { '-frounding-math' }
		--         }
		--     }
		-- }

		require 'lspconfig'.phpactor.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		require 'lspconfig'.clangd.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		require 'lspconfig'.qmlls.setup {
			cmd = { "qmlls6" },
			on_attach = on_attach_clean,
		}

		require 'lspconfig'.marksman.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		require 'lspconfig'.vimls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}


		require 'lspconfig'.eslint.setup {}

		require 'lspconfig'.cmake.setup {
			cmd = { '/home/m/.local/bin/cmake-language-server' },
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
		}

		require 'lspconfig'.pyright.setup {
			command = "pyright-langserver",
			on_attach = on_attach,
			capabilities = capabilities,
		}

		require 'lspconfig'.ts_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		require 'lspconfig'.taplo.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		require 'lspconfig'.bashls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		require 'lspconfig'.rust_analyzer.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
			settings = {
				['rust-analyzer'] = {},
			},
		}

		require 'lspconfig'.zls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				zls = {
					enable_snippets = true,
					enable_inlay_hints = true,
					warn_style = true,
					inlay_hints_show_builtin = true,
				}
			}
		}

		require 'lspconfig'.html.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require 'lspconfig'.jsonls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		require 'lspconfig'.cssls.setup {
			on_attach = on_attach,
			capabilities = capabilities
		}

		require 'lspconfig'.html.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		-- require 'lspconfig'.volar.setup {
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
		-- }

		require 'lspconfig'.gopls.setup {
			on_attach = on_attach,
			capabilities = capabilities,

		}

		-- require 'lspconfig'.tailwindcss.setup {
		-- 	on_attach = on_attach_clean,
		-- 	capabilities = capabilities,
		-- }

		require 'lspconfig'.unocss.setup {
			on_attach = on_attach_clean,
			capabilities = capabilities,
			filetypes = {
				'html',
				'javascriptreact',
				'rescript',
				'typescriptreact',
				'vue',
				'svelte'
			},
			root_dir = function(fname)
				return require 'lspconfig.util'.root_pattern('unocss.config.js', 'unocss.config.ts', 'uno.config.js',
					'uno.config.ts')(fname)
			end
		}
	end,

}
