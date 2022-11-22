local config = {
    cmd = {'/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

local bundles = {
    vim.fn.glob("/home/m/InstalledApplicationsDev/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*", 1)
};

vim.list_extend(bundles, vim.split(vim.fn.glob("/home/m/InstalledApplicationsDev/vscode-java-test/server/*.jar", 1), "\n"))
config['init_options'] = {
    bundles = bundles;
}

config['on_attach'] = function(client, bufnr)

  -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
  -- you make during a debug session immediately.
  -- Remove the option if you do not want that.
  -- You can use the `JdtHotcodeReplace` command to trigger it manually
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  require"jdtls.dap".setup_dap_main_class_configs()

  -- Keymaps onAttach

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
  vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end)


end

require('jdtls').start_or_attach(config)
