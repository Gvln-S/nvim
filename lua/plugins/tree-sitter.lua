return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local status, treesitter = pcall(require, 'nvim-treesitter.configs')
      if not status then return end
      
      treesitter.setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = "BufReadPre",
    config = function()
      require('treesitter-context').setup({
        enable = true,
        max_lines = 1,
        separator = "─",
      })
    end
  }
}
