## NeoVim Configuration

"It's absolute trash but it's -my- absolute trash"

NeoVim configured for general programming use. Usability comperable to and exceeding VSCode. Most configuration uses Lua, however base Vim settings and keybindings are set in init.vim. This is so I can use the file on servers using the command `vim -Nu <(curl https://raw.githubusercontent.com/wrbright/nvim-config/master/init.vim)` in bash to source directly from this github repo

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
  Total: 74 plugins

  Loaded (51)
    ● bufferline.nvim 8.51ms  start
    ● cmp-buffer 0.17ms  nvim-cmp
    ● cmp-cmdline 0.33ms  nvim-cmp
    ● cmp-npm 0.22ms  nvim-cmp
    ● cmp-nvim-lsp 0.2ms  nvim-cmp
    ● cmp-path 0.22ms  nvim-cmp
    ● conform.nvim 1.26ms  start
    ● fidget.nvim 1.08ms 󰢱 fidget  nvim-lspconfig
    ● gen.nvim 0.76ms  start
    ● gitsigns.nvim 3.15ms  start
    ● gruvbox-material 0.22ms  start
    ● image.nvim 34.22ms  neo-tree.nvim
    ● image_preview.nvim 0.74ms  VeryLazy
    ● indent-blankline.nvim 9.34ms  start
    ● lazy.nvim 13.37ms  init.lua
    ● lazygit.nvim 0.44ms  start
    ● lspkind.nvim 0.21ms 󰢱 lspkind  nvim-cmp
    ● lualine.nvim 14.59ms  start
    ● LuaSnip 7.62ms 󰢱 luasnip  nvim-cmp
    ● mason-lspconfig.nvim 3.55ms  start
    ● mason.nvim 3.78ms  start
    ● neo-tree-diagnostics.nvim 0.22ms  start
    ● neo-tree.nvim 57.47ms  start
    ● neovim-session-manager 5.77ms  start
    ● nui.nvim 0.16ms  neo-tree.nvim
    ● nvim-cmp 36.41ms  start
    ● nvim-colorizer.lua 4.17ms  BufEnter
    ● nvim-dap 11.87ms  nvim-dap-ui
    ● nvim-dap-ui 12.25ms  start
    ● nvim-dap-virtual-text 0.37ms  nvim-dap
    ● nvim-dap-vscode-js 0.31ms  nvim-dap
    ● nvim-hlslens 0.28ms  start
    ● nvim-lspconfig 11.43ms  start
    ● nvim-navic 0.08ms 󰢱 lualine.components.navic  lualine.nvim
    ● nvim-nio 0.05ms 󰢱 nio  nvim-dap
    ● nvim-scrollbar 7.9ms  VeryLazy
    ● nvim-treesitter 14.5ms  start
    ● nvim-treesitter-refactor 4.85ms  nvim-treesitter
    ● nvim-treesitter-textobjects 2.48ms  nvim-treesitter
    ● nvim-ts-autotag 1.75ms  nvim-treesitter
    ● nvim-ufo 12.63ms  start
    ● nvim-web-devicons 0.77ms  bufferline.nvim
    ● plenary.nvim 0.24ms 󰢱 plenary.path  neovim-session-manager
    ● possession.nvim 1.86ms  start
    ● promise-async 1.06ms  nvim-ufo
    ● rainbow-delimiters.nvim 1.72ms  nvim-treesitter
    ● telescope-ui-select.nvim 0.28ms  telescope.nvim
    ● telescope.nvim 12.68ms  start
    ● vim-fugitive 1.58ms  BufEnter
    ● vim-snippets 0.48ms  start
    ● vim-wordmotion 1.93ms  BufEnter

  Not Loaded (23)
    ○ cmp-dap  <Leader>dd
    ○ cmp-nvim-lsp-signature-help  LspAttach
    ○ cmp_luasnip  InsertEnter
    ○ colortils.nvim  Colortils
    ○ Comment.nvim  gc (v)  gc  gcc
    ○ crates.nvim  BufRead Cargo.toml
    ○ hardtime.nvim  Hardtime enable
    ○ markdown-preview.nvim  markdown
    ○ NeoZoom.lua  Z
    ○ nvim-autopairs  InsertEnter
    ○ nvim-jdtls  java
    ○ nvim-regexplainer  <Leader>re
    ○ oil.nvim  Oil
    ○ pretty_hover  LspAttach
    ○ ReplaceWithRegister  grr
    ○ rnvimr  RnvimrToggle
    ○ suda.vim  SudaWrite
    ○ toggleterm.nvim  LazyGit  Ctop  LazyDocker  Browsh  Ranger  Gomucks
    ○ ts-node-action  <C-n>
    ○ tw-values.nvim  <leader>tw
    ○ undotree  UndotreeShow
    ○ vim-sandwich  s
    ○ vim-windowswap  <Leader>ww
```
