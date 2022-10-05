vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    auto_install = true,
  },
}

require("bufferline").setup({ 
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer" ,
        text_align = "left",
        separator = true
      }
      },
    }
  }
)

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#aaaaaa gui=nocombine]]

require("indent_blankline").setup {
  -- char_highlight_list = {
    -- "IndentBlanklineIndent1",
   -- }
}
require("nvim-tree").setup({})

