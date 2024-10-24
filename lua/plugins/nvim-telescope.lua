return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>tfw', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>tfb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>tfh', builtin.help_tags, {})
      vim.keymap.set('n', '<Leader>tff', builtin.find_files, {})
      vim.keymap.set('n', '<Leader>trf', ':Telescope oldfiles<CR>', {})
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {
            }
          }
        }
      })
      require('telescope').load_extension('ui-select')
    end
  },
}



