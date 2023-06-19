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

### ToggleTerm + extras
![image](https://user-images.githubusercontent.com/55282244/227053539-29a461a2-ae71-4e9d-9ae8-b5038109fe7b.png)
![image](https://user-images.githubusercontent.com/55282244/227054369-c7d07e12-73a8-4b3d-8b01-660042b14070.png)
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
  Total: 63 plugins

  Loaded (40)
    ● LuaSnip 3.7ms   nvim-cmp
    ● bufferline.nvim 2.43ms  start
    ● cmp-buffer 0.15ms   nvim-cmp
    ● cmp-cmdline 0.28ms   nvim-cmp
    ● cmp-npm 0.21ms   nvim-cmp
    ● cmp-nvim-lsp 0.21ms   nvim-cmp
    ● cmp-path 0.17ms   nvim-cmp
    ● fidget.nvim 0.55ms   nvim-lspconfig
    ● gitsigns.nvim 0.78ms   nvim-scrollbar
    ● gruvbox-material 0.26ms  start
    ● indent-blankline.nvim 1.15ms  start
    ● lazy.nvim 6.33ms   init.lua
    ● lazygit.nvim 0.29ms  start
    ● lspkind.nvim 0.09ms   nvim-cmp
    ● lualine.nvim 11.47ms  start
    ● neo-tree.nvim 9.75ms  start
    ● nui.nvim 0.23ms   neo-tree.nvim
    ● null-ls.nvim 0.29ms   nvim-lspconfig
    ● nvim-cmp 34ms  start
    ● nvim-colorizer.lua 1.96ms  BufEnter
    ● nvim-hlslens 0.38ms  start
    ● nvim-jdtls 0.58ms   nvim-lspconfig
    ● nvim-lspconfig 9.76ms  start
    ● nvim-navic 0.13ms   lualine.nvim
    ● nvim-scrollbar 4.11ms  start
    ● nvim-treesitter 5.59ms  start
    ● nvim-treesitter-refactor 1.81ms   nvim-treesitter
    ● nvim-treesitter-textobjects 0.9ms   nvim-treesitter
    ● nvim-ts-autotag 0.61ms   nvim-treesitter
    ● nvim-ts-rainbow 0.47ms   nvim-treesitter
    ● nvim-web-devicons 0.36ms   bufferline.nvim
    ● oil.nvim 1.23ms  start
    ● plenary.nvim 0.14ms   nvim-cmp
    ● possession.nvim 1.19ms  start
    ● telescope.nvim 0.57ms  start
    ● toggleterm.nvim 0.87ms  start
    ● vim-fugitive 1.23ms  BufEnter
    ● vim-obsession 0.21ms  start
    ● vim-snippets 0.13ms  start
    ● yayb 0.38ms  start

  Not Loaded (23)
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
    ○ playground   TSPlaygroundToggle
    ○ pretty_hover  LspAttach
    ○ rnvimr   RnvimrToggle
    ○ suda.vim   SudaWrite
    ○ tagbar   TagbarToggle   <F1>
    ○ ts-node-action   <C-n>
    ○ undotree   UndotreeShow
    ○ vim-sandwich   s
    ○ vim-windowswap   <Leader>ww

```
