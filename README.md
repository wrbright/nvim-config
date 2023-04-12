## NeoVim Configuration

"It's absolute trash but it's -my- absolute trash"

NeoVim configured for general programming use. Usability comperable to and exceeding an IDE. Most configuration uses Lua, however base Vim settings and keybindings are set in init.vim. This is so I can use the file on servers using the command ``vim -Nu <(curl https://raw.githubusercontent.com/wrbright/nvim-config/init.vim)`` to source directly from this github repo

Lazy Loaded with Lazy.nvim, nvim-cmp for completion, LSP integrationg with lspconfig boilerplate, Dap integration, gruvbox colors with transparent background. Requires transparent terminal for transparency

```
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
"  Vim Based Configurations.                                                 "
"                                                                            "
"  Goal: This file should work when using vim (not neovim) without plugins.  "
"  Non-Goal: No errors on startup or during usage when used with vim.        "
"  ToDo: Re-reate vim specific ColorScheme                                   "
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

```
  Total: 58 plugins
  
  Loaded (45)
    ● LuaSnip 3.96ms   nvim-cmp
    ● bufferline.nvim 4.06ms  start
    ● cmp-buffer 0.14ms   nvim-cmp
    ● cmp-cmdline 0.19ms   nvim-cmp
    ● cmp-dap 0.21ms   nvim-cmp
    ● cmp-npm 0.21ms   nvim-cmp
    ● cmp-nvim-lsp 0.19ms   nvim-cmp
    ● cmp-nvim-lsp-signature-help 0.19ms   nvim-cmp
    ● cmp-path 0.21ms   nvim-cmp
    ● cmp_luasnip 0.19ms   nvim-cmp
    ● crates.nvim 0.5ms   nvim-cmp
    ● fidget.nvim 0.1ms   nvim-lspconfig
    ● gitsigns.nvim 9.75ms  start
    ● gruvbox-material 0.06ms  start
    ● image.nvim 0.06ms  start
    ● indent-blankline.nvim 2.07ms  start
    ● lazy.nvim 7.47ms   init.lua
    ● lazygit.nvim 0.7ms   nvim-dap
    ● lspkind.nvim 0.13ms   nvim-cmp
    ● lualine.nvim 13.05ms  start
    ● neo-tree.nvim 19.81ms  start
    ● nui.nvim 0.45ms   neo-tree.nvim
    ● null-ls.nvim 0.25ms   nvim-lspconfig
    ● nvim-autopairs 1.59ms  start
    ● nvim-cmp 22.75ms  start
    ● nvim-colorizer.lua 3.24ms  BufEnter
    ● nvim-dap 9.78ms   cmp-dap
    ● nvim-dap-ui 0.31ms   nvim-dap
    ● nvim-dap-virtual-text 0.38ms   nvim-dap
    ● nvim-dap-vscode-js 0.31ms   nvim-dap
    ● nvim-hlslens 0.52ms  start
    ● nvim-jdtls 0.46ms   nvim-lspconfig
    ● nvim-lspconfig 13.48ms  start
    ● nvim-navic 0.09ms   lualine.nvim
    ● nvim-scrollbar 4.95ms  start
    ● nvim-treesitter 10.71ms  start
    ● nvim-treesitter-refactor 3.88ms   nvim-treesitter
    ● nvim-treesitter-textobjects 1.92ms   nvim-treesitter
    ● nvim-ts-autotag 1.22ms   nvim-treesitter
    ● nvim-ts-rainbow 0.75ms   nvim-treesitter
    ● nvim-web-devicons 0.42ms   bufferline.nvim
    ● plenary.nvim 4.6ms  start
    ● toggleterm.nvim 1.7ms  start
    ● vim-fugitive 1.81ms  start
    ● vim-snippets 0.38ms  start
  
  Not Loaded (13)
    ○ Comment.nvim   gc
    ○ ReplaceWithRegister   grr
    ○ colortils.nvim   Colortils
    ○ markdown-preview.nvim   MarkdownPreview
    ○ playground   TSPlaygroundToggle
    ○ rnvimr   RnvimrToggle
    ○ suda.vim   SudaWrite
    ○ tagbar   TagbarToggle   <F1>
    ○ telescope.nvim   Telescope
    ○ ts-node-action   <C-n>
    ○ undotree   UndotreeShow
    ○ vim-sandwich   s
    ○ vim-windowswap   <Leader>ww
