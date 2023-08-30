## NeoVim Configuration

"It's absolute trash but it's -my- absolute trash"

NeoVim configured for general programming use. Usability comperable to and exceeding VSCode. Most configuration uses Lua, however base Vim settings and keybindings are set in init.vim. This is so I can use the file on servers using the command ``vim -Nu <(curl https://raw.githubusercontent.com/wrbright/nvim-config/master/init.vim)`` in bash to source directly from this github repo

Lazy Loaded with Lazy.nvim, nvim-cmp for completion, LSP integrationg with lspconfig boilerplate, Dap integration, gruvbox colors with transparent background. Requires transparent terminal for transparency

```
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
"  Vim Based Configurations.                                                 "
"                                                                            "
"  Goal: This file should work when using vim (not neovim) without plugins.  "
"  Non-Goal: No errors on startup or during usage when used with vim.        "
"  ToDo: Re-create vim specific ColorScheme                                   "
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
Total: 61 plugins

Loaded (40)
    ● LuaSnip 4.8ms   nvim-cmp
    ● bufferline.nvim 6.12ms  start
    ● cmp-buffer 0.17ms   nvim-cmp
    ● cmp-cmdline 0.22ms   nvim-cmp
    ● cmp-npm 0.23ms   nvim-cmp
    ● cmp-nvim-lsp 0.24ms   nvim-cmp
    ● cmp-path 0.24ms   nvim-cmp
    ● fidget.nvim 0.66ms   nvim-lspconfig
    ● gitsigns.nvim 0.95ms   nvim-scrollbar
    ● gruvbox-material 0.15ms  start
    ● indent-blankline.nvim 0.98ms  start
    ● lazy.nvim 13.38ms   init.lua
    ● lazygit.nvim 0.44ms  start
    ● lspkind.nvim 0.18ms   nvim-cmp
    ● lualine.nvim 21.41ms  start
    ● neo-tree.nvim 10.69ms  start
    ● neovim-session-manager 3.03ms  start
    ● nui.nvim 0.18ms   neo-tree.nvim
    ● null-ls.nvim 0.22ms   nvim-lspconfig
    ● nvim-cmp 16.73ms  start
    ● nvim-colorizer.lua 3.52ms  BufEnter
    ● nvim-hlslens 0.31ms  start
    ● nvim-jdtls 0.26ms   nvim-lspconfig
    ● nvim-lspconfig 10.24ms  start
    ● nvim-navic 0.09ms   lualine.nvim
    ● nvim-scrollbar 5.96ms  start
    ● nvim-treesitter 7.95ms  start
    ● nvim-treesitter-refactor 2.61ms   nvim-treesitter
    ● nvim-treesitter-textobjects 1.23ms   nvim-treesitter
    ● nvim-ts-autotag 0.71ms   nvim-treesitter
    ● nvim-web-devicons 0.57ms   bufferline.nvim
    ● oil.nvim 0.99ms  start
    ● plenary.nvim 0.17ms   neovim-session-manager
    ● possession.nvim 1.16ms  start
    ● rainbow-delimiters.nvim 0.86ms   nvim-treesitter
    ● telescope.nvim 0.38ms  start
    ● toggleterm.nvim 5.19ms  start
    ● vim-fugitive 1.17ms  BufEnter
    ● vim-snippets 0.18ms  start
    ● vim-wordmotion 1.3ms  start

Not Loaded (21)
    ○ Comment.nvim   gc
    ○ NeoZoom.lua   Z
    ○ ReplaceWithRegister   grr
    ○ cmp-dap   <Leader>dd
    ○ cmp-nvim-lsp-signature-help  LspAttach
    ○ cmp_luasnip  InsertEnter
    ○ colortils.nvim   Colortils
    ○ crates.nvim  BufRead Cargo.toml
    ○ markdown-preview.nvim   markdown
    ○ nvim-autopairs  InsertEnter
    ○ nvim-dap   <Leader>dd
    ○ nvim-dap-ui   nvim-dap
    ○ nvim-dap-virtual-text   nvim-dap
    ○ nvim-dap-vscode-js   nvim-dap
    ○ pretty_hover  LspAttach
    ○ rnvimr   RnvimrToggle
    ○ suda.vim   SudaWrite
    ○ ts-node-action   <C-n>
    ○ undotree   UndotreeShow
    ○ vim-sandwich   s
    ○ vim-windowswap   <Leader>ww
