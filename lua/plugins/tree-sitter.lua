return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local config = require('nvim-treesitter.configs')
      config.setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        enable = true,
        throttle = true,
        max_lines = 1,
        patterns = {
          default = {
            'class',
            'function',
            'method',
          },
        },
        separator = "─",
      })
      vim.cmd [[
      hi TreesitterContextSeparator guifg=#3B4252
      hi TreesitterContextLineNumber guifg=#4C566A
      hi TreesitterContextBottom gui=none
      ]]
    end
  }
}
