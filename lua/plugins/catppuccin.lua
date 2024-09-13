return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppucin',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      transparent_background = true,
    })
    vim.cmd.colorscheme 'catppuccin'
  end
}

