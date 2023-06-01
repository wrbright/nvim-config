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
  Total: 60 plugins

  Loaded (38)
    ● LuaSnip 4.06ms   nvim-cmp
    ● bufferline.nvim 3.33ms  start
    ● cmp-buffer 0.14ms   nvim-cmp
    ● cmp-cmdline 0.15ms   nvim-cmp
    ● cmp-npm 0.19ms   nvim-cmp
    ● cmp-nvim-lsp 0.14ms   nvim-cmp
    ● cmp-path 0.15ms   nvim-cmp
    ● fidget.nvim 0.05ms   nvim-lspconfig
    ● gitsigns.nvim 0.83ms   nvim-scrollbar
    ● gruvbox-material 0.06ms  start
    ● indent-blankline.nvim 0.89ms  start
    ● lazy.nvim 4.33ms   init.lua
    ● lazygit.nvim 0.29ms  start
    ● lspkind.nvim 0.11ms   nvim-cmp
    ● lualine.nvim 9.12ms  start
    ● null-ls.nvim 0.22ms   nvim-lspconfig
    ● nvim-cmp 15.52ms  start
    ● nvim-colorizer.lua 1.29ms  BufEnter
    ● nvim-hlslens 0.14ms   nvim-scrollbar
    ● nvim-jdtls 0.41ms   nvim-lspconfig
    ● nvim-lspconfig 7.71ms  start
    ● nvim-navic 0.06ms   lualine.nvim
    ● nvim-scrollbar 4.01ms  start
    ● nvim-tree.lua 6.94ms  start
    ● nvim-treesitter 5.16ms  start
    ● nvim-treesitter-refactor 1.52ms   nvim-treesitter
    ● nvim-treesitter-textobjects 0.84ms   nvim-treesitter
    ● nvim-ts-autotag 0.46ms   nvim-treesitter
    ● nvim-ts-rainbow 0.38ms   nvim-treesitter
    ● nvim-web-devicons 0.28ms   bufferline.nvim
    ● oil.nvim 2.79ms  start
    ● plenary.nvim 0.18ms   nvim-cmp
    ● possession.nvim 1.44ms  start
    ● telescope.nvim 0.29ms  start
    ● toggleterm.nvim 1ms  start
    ● vim-fugitive 1.26ms  BufEnter
    ● vim-snippets 0.32ms  start
    ● yayb 0.18ms  start

  Not Loaded (22)
    ○ Comment.nvim   gc
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
