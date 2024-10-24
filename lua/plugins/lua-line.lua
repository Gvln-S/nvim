return {
  'nvim-lualine/lualine.nvim',
   config = function()
    require('lualine').setup({
      options = {
        theme = 'dracula'
      },
      sections = {
        lualine_b = {'branch', 'diff', 'git_status'},
      }
    })
  end
}

