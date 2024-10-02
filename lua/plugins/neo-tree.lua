return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x', 
    dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim', 
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('neo-tree').setup({
      enable_git_status = true,
        follow_current_file = {
        enabled = true
      }
    })

    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = true,
        },
      },
    })

    vim.keymap.set('n', '<leader>m', ':Neotree reveal left<CR>', {})
    vim.keymap.set('n', '<leader>n', ':Neotree close<CR>', {}) 
    end
}


 

