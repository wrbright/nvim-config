
--------------------------------------------------------------------
---------------------------- lsp Plugins ----------------------------
--------------------------------------------------------------------

require"fidget".setup {}

--------------------------------------------------------------------
---------------------------- lsp config ----------------------------
--------------------------------------------------------------------

-- Mapping new bindings that do not conflict with any current mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Mappings, includes, etc. that must only be set when the LSP Client has been attached
local on_attach = require'sConf/on_attach'

-- Set up lspconfig.
local capabilities = require'cmp_nvim_lsp'.default_capabilities()

local lsp_flags = {
    debounce_text_changes = 100,
}

require'lspconfig'.sumneko_lua.setup {
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

-- require('lspconfig').ccls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     init_options = {
--         compilationDatabaseDirectory = "build";
--         index = {
--             threads = 0;
--         };
--         clang = {
--             excludeArgs = { "-frounding-math" };
--         };
--     }
-- }


require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

require'lspconfig'.marksman.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

local vscodeCapabilities = vim.lsp.protocol.make_client_capabilities()
vscodeCapabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.jsonls.setup {
    on_attach = on_attach,
    capabilities = {vscodeCapabilities, vscodeCapabilities},
}

require'lspconfig'.cssls.setup {
    on_attach = on_attach,
    capabilities = {capabilities, vscodeCapabilities},
}

require'lspconfig'.eslint.setup { }

require'lspconfig'.vimls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require'lspconfig'.cmake.setup {
    cmd = { "/home/m/.local/bin/cmake-language-server" },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

require'lspconfig'.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require'lspconfig'.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require'lspconfig'.taplo.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        ["rust-analyzer"] = {}
    }
}
