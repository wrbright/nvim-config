-- Disabling netrw (Ex)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

--------------------------------------------------------------------
--------------------------- Plugin Setup----------------------------
--------------------------------------------------------------------

require("nvim-treesitter.configs").setup {
    highlight = {
        additional_vim_regex_highlighting = true,
        enable = true,
        auto_install = true,
    }
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
                text = "File Explorer" ,
                text_align = "left",
                separator = true,
            }
        },
    }
}

require('lualine').setup {
    theme = 'gruvbox'
}

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

require('telescope').load_extension('dap')

--------------------------------------------------------------------
----------------------------- Mappings -----------------------------
--------------------------------------------------------------------

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function( client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
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
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


--------------------------------------------------------------------
---------------------------- LSP Config ----------------------------
--------------------------------------------------------------------
local lsp_flags = {
    debounce_text_changes = 150,
}
require('lspconfig').sumneko_lua.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'},
            },
        },
    },
}

require('lspconfig').ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}

require('lspconfig').vimls.setup{}

require'lspconfig'.cmake.setup{
    cmd = { "/home/m/.local/bin/cmake-language-server" },
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,

}

require('lspconfig').taplo.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}



require('lspconfig').bashls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
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
    name ="Launch lldb",
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
    runITerminal = false,
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
  args = {os.getenv('HOME') .. '/home/m/InstalledApplicationsDev/vscode-firefox-debug/dist/adapter.bundle.js'},
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

------
-- rebindings general
----
vim.fn.sign_define('DapBreakpoint', {text='⬟', texthl='red', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='⬠', texthl='red', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⮞', texthl='red', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='✗', texthl='red', linehl='', numhl=''})
