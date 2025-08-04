## NeoVim Configuration

Why not both? Vim config and NeoVim config patched together lovingly.

NeoVim configured for general programming use. Usability comperable to an IDE. Most configuration uses Lua, however base Vim settings and keybindings are set in init.vim. This is so I can use the file on servers using the command `vim -Nu <(curl https://raw.githubusercontent.com/wrbright/nvim-config/master/init.vim)` in bash to source directly from this github repo

Lazy Loaded with Lazy.nvim, nvim-cmp for completion, LSP integrationg with lspconfig boilerplate, Dap integration, gruvbox colors with transparent background. Requires transparent terminal for transparency

```
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
"                          Vim Based Configurations.                         "
"                                                                            "
"  Goal: This file should work when using vim (not neovim) without plugins.  "
"  Non-Goal: No errors on startup or during usage when used with vim.        "
"  ToDo: Re-create Gruvbox ColorScheme for Vim Manually                      "
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
```

## What it Looks Like

### General Usage

![image](https://user-images.githubusercontent.com/55282244/227053398-78597a9e-19e4-46b2-8c7b-dd749e41f9ef.png)

### Base Vim Config

![Screenshot_20230623_181141](https://github.com/wrbright/nvim-config/assets/55282244/88605c2d-a7b5-4024-9554-a6b61a08e035)

### ToggleTerm + extras

#### Lazy Git

![image](https://user-images.githubusercontent.com/55282244/227053539-29a461a2-ae71-4e9d-9ae8-b5038109fe7b.png)

#### Ranger

![image](https://user-images.githubusercontent.com/55282244/227054369-c7d07e12-73a8-4b3d-8b01-660042b14070.png)

#### Lazy Docker

![image](https://user-images.githubusercontent.com/55282244/231551059-05dbf841-b19f-4c7a-b7c0-eba8ccb4f6f0.png)

### LSP Integration

![image](https://user-images.githubusercontent.com/55282244/227053951-e9945c5a-8844-4a44-8835-c5822c2da710.png)

### Git Integration

![image](https://user-images.githubusercontent.com/55282244/227054160-12591aad-f4ec-48dd-83ad-55ea2b33bad6.png)

### Dap

![image](https://user-images.githubusercontent.com/55282244/227055214-0bd29846-6ed5-42a4-a987-021d3dea9988.png)

## Plugins (lazy output)

Loaded: Plugins loaded by default when entering a directory.

Unloaded: Plugins not loaded until an event fires

```
  Total: 73 plugins

  Loaded (43)
    ● bufferline.nvim 4.12ms  start
    ● cmp-buffer 0.16ms  nvim-cmp
    ● cmp-cmdline 0.16ms  nvim-cmp
    ● cmp-npm 0.17ms  nvim-cmp
    ● cmp-nvim-lsp 0.2ms  nvim-cmp
    ● cmp-path 0.14ms  nvim-cmp
    ● conform.nvim 0.46ms  start
    ● fidget.nvim 0.66ms 󰢱 fidget  nvim-lspconfig
    ● gitsigns.nvim 1.38ms  start
    ● gruvbox-material 0.11ms  start
    ● image.nvim 0.16ms  neo-tree.nvim
    ● indent-blankline.nvim 3.01ms  start
    ● lazy.nvim 5.79ms  init.lua
    ● lspkind.nvim 0.13ms 󰢱 lspkind  nvim-cmp
    ● lualine.nvim 7.77ms  start
    ● LuaSnip 3.85ms 󰢱 luasnip  nvim-cmp
    ● mason-lspconfig.nvim 13.76ms  start
    ● mason.nvim 1.14ms 󰢱 mason-core.functional  mason-lspconfig.nvim
    ● neo-tree-diagnostics.nvim 0.08ms 󰢱 neo-tree.sources.diagnostics  neo-tree.nvim
    ● neo-tree.nvim 10.54ms  start
    ● neovim-session-manager 1.28ms  start
    ● nui.nvim 0.12ms  neo-tree.nvim
    ● nvim-cmp 17.94ms  start
    ● nvim-colorizer.lua 1.57ms  BufEnter
    ● nvim-hlslens 0.21ms  start
    ● nvim-lspconfig 10.38ms  start
    ● nvim-navic 0.06ms 󰢱 lualine.components.navic  lualine.nvim
    ● nvim-scrollbar 2.61ms  VeryLazy
    ● nvim-treesitter 7.34ms 󰢱 nvim-treesitter  nvim-ts-autotag
    ● nvim-treesitter-refactor 3.77ms  nvim-treesitter
    ● nvim-treesitter-textobjects 1.32ms  nvim-treesitter
    ● nvim-ts-autotag 8.63ms  start
    ● nvim-ufo 3.12ms  start
    ● nvim-web-devicons 0.3ms  bufferline.nvim
    ● plenary.nvim 0.22ms  telescope.nvim
    ● possession.nvim 1.05ms  start
    ● promise-async 0.14ms  nvim-ufo
    ● rainbow-delimiters.nvim 0.3ms  nvim-treesitter
    ● telescope-ui-select.nvim 0.2ms  telescope.nvim
    ● telescope.nvim 6.77ms  start
    ● vim-fugitive 0.75ms  BufEnter
    ● vim-snippets 0.13ms  start
    ● vim-wordmotion 0.86ms  BufEnter

  Not Loaded (30)
    ○ cmp-dap  <Leader>dd
    ○ cmp-nvim-lsp-signature-help  LspAttach
    ○ cmp_luasnip  InsertEnter
    ○ colortils.nvim  Colortils
    ○ Comment.nvim  gc  gcc  gc (v)
    ○ crates.nvim  BufRead Cargo.toml
    ○ gen.nvim  Gen  <Leader>n
    ○ hardtime.nvim  Hardtime enable
    ○ lazygit.nvim  LazyGit
    ○ markdown-preview.nvim  markdown
    ○ NeoZoom.lua  Z
    ○ nvim-autopairs  InsertEnter
    ○ nvim-dap  <Leader>dd  nvim-dap-ui
    ○ nvim-dap-go  <Leader>dd
    ○ nvim-dap-ui  <leader>dd
    ○ nvim-dap-virtual-text  nvim-dap
    ○ nvim-dap-vscode-js  nvim-dap
    ○ nvim-jdtls  java
    ○ nvim-nio  nvim-dap-ui
    ○ nvim-regexplainer  <Leader>re
    ○ pretty_hover  LspAttach
    ○ ReplaceWithRegister  grr
    ○ rnvimr  RnvimrToggle
    ○ suda.vim  SudaWrite
    ○ toggleterm.nvim  LazyGit  Ranger  Gomucks  Browsh  Btop  Ctop  FTP  TermSCP  LazyDocker
    ○ ts-node-action  <C-n>
    ○ tw-values.nvim  <leader>tw
    ○ undotree  UndotreeShow
    ○ vim-sandwich  s
```
