return {
  {
    'tpope/vim-fugitive'
  },
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsingns').setup()

    vim.keymap.set('n', '<leader>gc', ':Gitsigns preview_hunk<CR>', {})
    vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>', {})
  end
}
