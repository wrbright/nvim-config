-- Disabling netrw (Ex)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
-- fixing unpack
table.unpack = table.unpack or unpack;

--------------------------------------------------------------------
--------------------------- Plugin Setup----------------------------
--------------------------------------------------------------------
require("nvim-treesitter.configs").setup {
    highlight = {
        additional_vim_regex_highlighting = true,
        enable = true,
        auto_install = true,
        disable = { "help" },
    },
    refactor = {
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "<space>grr"
            }
        },
    },
    indent = {
        enable = true,
    },
    playground = {
        enable = true,
    },
    textobjects = {
        enable = true,
        lookahead = true,
        keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
}

require("nvim-autopairs").setup {
    enable_check_bracket_line = false,
}

require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true,
            }
        },
    }
}

local navic = require("nvim-navic");

require('lualine').setup {
    theme = 'gruvbox',
    sections = {
        lualine_c = {
            { navic.get_location, cond = navic.is_available },
        }
    }
}

require("scrollbar").setup({
    excluded_buftypes = {
        "terminal",
        "nofile",
    },
    handle = {
        color = "#54504f"
    },
    marks = {
        Error = { color = "#ff0000" },
        Search = { color = "#ff7700" }
    }
})
require("scrollbar.handlers.gitsigns").setup()

-- require("scrollbar.handlers.search").setup({
--     override_lens = function() end,
-- })

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

require('gitsigns').setup {}

require('Comment').setup {}

require("nvim-tree").setup {
    open_on_setup_file = true,
    open_on_setup = true,
    open_on_tab = true,
    focus_empty_on_setup = true,
    sync_root_with_cwd = true,
}

require("dapui").setup({
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40, -- 40 columns
            position = "right",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    }
})

require("telescope").setup {}

require('scrollbar.handlers.search').setup({
    override_lens = function(render, posList, nearest, idx, relIdx)
        local sfw = vim.v.searchforward == 1
        local indicator, text, chunks
        local absRelIdx = math.abs(relIdx)
        if absRelIdx > 1 then
            indicator = ('%d%s'):format(absRelIdx, sfw ~= (relIdx > 1) and '▲' or '▼')
        elseif absRelIdx == 1 then
            indicator = sfw ~= (relIdx == 1) and '▲' or '▼'
        else
            indicator = ''
        end

        local lnum, col = table.unpack(posList[idx])
        if nearest then
            local cnt = #posList
            if indicator ~= '' then
                text = ('[%s %d/%d]'):format(indicator, idx, cnt)
            else
                text = ('[%d/%d]'):format(idx, cnt)
            end
            chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLensNear' } }
        else
            text = ('[%s %d]'):format(indicator, idx)
            chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLens' } }
        end
        render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
    end,
})

local kopts = { noremap = true, silent = true }

-- Remapping search to hlslens search functions
vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

-- vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99 -- Using ufo provider needs a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

require('ufo').setup({
    provider_selector = function(_, _, _)
        return { 'treesitter', 'indent' }
    end
})

--------------------------------------------------------------------
----------------------------- Mappings -----------------------------
--------------------------------------------------------------------

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

--------------------------------------------------------------------
---------------------------- LSP Config ----------------------------
--------------------------------------------------------------------


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>fm', function() vim.lsp.buf.format { async = true } end, bufopts)

    -- nvim-navic binding
    navic.attach(client, bufnr);
end
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_flags = {
    debounce_text_changes = 100,
}
require('lspconfig').sumneko_lua.setup {
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

require('lspconfig').ccls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math" };
        };
    }
}

require('lspconfig').vimls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require 'lspconfig'.cmake.setup {
    cmd = { "/home/m/.local/bin/cmake-language-server" },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,

}

require('lspconfig').taplo.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}



require('lspconfig').bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        ["rust-analyzer"] = {}
    }
}

--------------------------------------------------------------------
---------------------- Nvim-Dap Configuration ----------------------
--------------------------------------------------------------------

require("nvim-dap-virtual-text").setup {
    commented = true,
}

local dap = require('dap')
dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb",
}

local lldb = {
    name = "Launch lldb",
    type = "lldb",
    request = "launch",
    program = function()
        return vim.fn.input(
            "Path to Executable: ",
            vim.fn.getcwd() .. "/",
            "file"
        )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
}

dap.configurations.rust = {
    lldb
}

dap.configurations.c = {
    lldb
}

dap.configurations.cpp = {
    lldb
}

dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/home/m/InstalledApplicationsDev/vscode-firefox-debug/dist/adapter.bundle.js' },
}

dap.configurations.typescript = {
    name = 'Debug with Firefox',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'http://localhost:3000',
    webRoot = '${workspaceFolder}',
    firefoxExecutable = '/usr/bin/firefox'
}

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

--------------------------------------------------------------------
----------------------------- Nvim CMP  ----------------------------
--------------------------------------------------------------------
local cmp = require 'cmp'
local lspkind = require('lspkind');
local luasnip = require("luasnip");

local has_words_before = function()
    local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
    }),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
    }, {
        { name = 'buffer' },
    }),
    experimental = {
        ghost_text = true,
    },
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
    end,
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            symbol_map = {
                Method = "  ",
                Function = "  ",
                Variable = "  ",
                Field = " ﰠ ",
                TypeParameter = "<>",
                Constant = "  ",
                Class = " ﴯ ",
                Interface = "  ",
                Struct = " פּ ",
                Event = "  ",
                Operator = "  ",
                Module = "  ",
                Property = "  ",
                Enum = " 練",
                Reference = "  ",
                Keyword = "  ",
                File = "  ",
                Folder = " ﱮ ",
                Color = "  ",
                Unit = " 塞 ",
                Snippet = "  ",
                Text = "  ",
                Constructor = "  ",
                Value = "  ",
                EnumMember = "  "
            },

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                return vim_item
            end
        })
    }
})

require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})

require("luasnip.loaders.from_snipmate").lazy_load()

-- luasnip.add_snippets = {
--     all = {
--
--     },
--     c = {
--         luasnip.parser.parse_snippet("func", "lol" )
--     }
-- }
luasnip.config.set_config {
    history = true,

    updateevents = "TextChanged, TextChangedI"
}
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

------
-- rebindings general
----
vim.fn.sign_define('DapBreakpoint', { text = '⬟', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '⬠', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '⮞', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '✗', texthl = 'red', linehl = '', numhl = '' })
