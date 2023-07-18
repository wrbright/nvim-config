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

vim.cmd'set expandtab'
config['on_attach'] = require("luaConf/on_attach")


require'jdtls'.start_or_attach(config)
