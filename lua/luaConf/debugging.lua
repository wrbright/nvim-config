--------------------------------------------------------------------
---------------------- Nvim-Dap Configuration ----------------------
--------------------------------------------------------------------

require "dapui".setup {
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40, -- default length by columns
            position = "right",
        },
        {
            elements = {
                "repl",
            },
            size = 0.25, -- 25% of total vertical lines
            position = "bottom",
        },
    }
}

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
    args = {},
    request = "attach",
    pid = require 'dap.utils'.pick_process,
}

-- {
--     name = "Launch lldb",
--     type = "lldb",
--     request = "launch",
--     program = function()
--         return vim.fn.input(
--             "Path to Executable: ",
--             vim.fn.getcwd() .. "/",
--             "file"
--         )
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = false,
--     args = {},
--     runInTerminal = false,
-- }
-- program = function()
--     return vim.fn.input(
--         "Path to Executable: ",
--         vim.fn.getcwd() .. "/",
--         "file"
--     )
-- end,

dap.configurations.rust = {
    lldb
}

dap.configurations.c = {
    lldb
}

dap.configurations.cpp = {
    lldb
}

-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
-- }

dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/m/InstalledApplicationsDev/vscode-firefox-debug/dist/adapter.bundle.js' },
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
-- "~/InstalledApplicationsDev/vscode-js-debug", -- Path to vscode-js-debug installation.

require"dap-vscode-js".setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    debugger_path = os.getenv('HOME') .. '/InstalledApplicationsDev/vscode-js-debug/dist/adapter.bundle.js',
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    -- log_file_path = "/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

-- for _, language in ipairs({ "typescript", "javascript" }) do
dap.configurations.javascript = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
    }
    -- {
    --     type = "pwa-node",
    --     request = "attach",
    --     name = "Attach",
    --     processId = require 'dap.utils'.pick_process,
    --     cwd = "${workspaceFolder}",
    -- }
}
-- end

vim.fn.sign_define('DapBreakpoint', { text = '⬟', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '⬠', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '➤', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '⤬', texthl = 'red', linehl = '', numhl = '' })
