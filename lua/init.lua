-- Disabling netrw (Ex)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
-- fixing unpack
---@diagnostic disable-next-line: deprecated
table.unpack = table.unpack or unpack

--------------------------------------------------------------------
--------------------------- Plugin Setup----------------------------
--------------------------------------------------------------------
require("nvim-treesitter.configs").setup{
    highlight = {
        additional_vim_regex_highlighting = true,
        enable = true,
        auto_install = true,
        disable = { "help" },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gtn",
            node_incremental = "gti",
            scope_incremental = "gts",
            node_decremental = "gtd",
        },
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
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["av"] = "@parameter.outer",
                ["iv"] = "@parameter.inner",
                ["ik"] = "@block.inner",
                ["ak"] = "@block.outer",
            },
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
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
    open_on_setup_file = true,
    open_on_setup = true,
    open_on_tab = true,
    -- focus_empty_on_setup = true,
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

--------------------------------------------------------------------
----------------------------- Mappings -----------------------------
--------------------------------------------------------------------

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Remapping search to hlslens search functions
vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

-- vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)

-- Absolute Gold. Auto move mappings over from vim file. 
--
-- Place Maker G ["G] on your top vimscript mapping and Marker F ["F] over the lua code snippet below then run from vimscript
-- "zxdw"cdf "vd$dd`G`F��Jf'a"zp;;"cpx;"vp`G
--
-- uncomment and plave marker 
-- vim.api.nvim_set_keymap('', '', '', plugOpts)
--
-- Quotations must be fixed. Will flip input line order.

local plugOpts = { noremap = true, silent = true }


-- Does not work
vim.api.nvim_set_keymap('v', "<C-<Bslash>>", 'gc', plugOpts)
-- Does not work
vim.api.nvim_set_keymap('n', "<C-Bslash>", 'gcc', plugOpts)

vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeToggle<CR>', plugOpts)

vim.api.nvim_set_keymap('n', '<space>dd', ':lua require\'dapui\'.toggle()<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>dd', ':lua require\'dapui\'.toggle()<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>d<space>', ':lua require\'dap\'.continue()<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<A-O>', ':lua require\'dap\'.step_out()<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<A-o>', ':lua require\'dap\'.step_over()<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<A-i>', ':lua require\'dap\'.step_into()<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>b', ':lua require\'dap\'.toggle_breakpoint()<cr>', plugOpts)

vim.api.nvim_set_keymap('n', '<F1>', ':TagbarToggle<CR>', plugOpts)

vim.api.nvim_set_keymap('n', '<A-g>N', ':Gitsigns prev_hunk<CR>', plugOpts)
vim.api.nvim_set_keymap('n', '<A-g>n', ':Gitsigns next_hunk<CR>', plugOpts)
vim.api.nvim_set_keymap('n', '<A-g>', ':Gitsigns preview_hunk<CR>', plugOpts)

vim.api.nvim_set_keymap('n', '<space>x', ':BufferLinePickClose<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>t', ':BufferLinePick<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>l', ':BufferLineCycleNex<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>h', ':BufferLineCyclePrev<cr>', plugOpts)


vim.api.nvim_set_keymap('n', '<C-z>', ':Telescope live_grep<CR>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>rs', '<cmd>Telescope resume<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>m', '<cmd>Telescope marks<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>gf', '<cmd>Telescope live_grep<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>gb', ':lua require(\'telescope.builtin\').live_grep({prompt_title = \'find string in open buffers\', grep_open_files=true})<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>Telescope find_files<cr>', plugOpts)
vim.api.nvim_set_keymap('n', '<space>fb', '<cmd>Telescope buffers<cr><Esc>', plugOpts)





--------------------------------------------------------------------
---------------------------- LSP Config ----------------------------
--------------------------------------------------------------------


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = require("on_attach")
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

require 'lspconfig'.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,

}

require 'lspconfig'.marksman.setup {
    on_attach = on_attach,
    capabilities = capabilities,

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
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
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
            before = function(_, vim_item)
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
