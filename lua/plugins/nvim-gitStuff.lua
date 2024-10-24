return {
  {
    'tpope/vim-fugitive'
  },
  {
    "rbong/vim-flog",
    lazy = false,
    config = function()
      vim.keymap.set('n', '<leader>fg', ":Flog<CR>", { noremap = true, silent = true })
    end
  },
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsingns').setup()

    vim.keymap.set('n', '<leader>gc', ':Gitsigns preview_hunk<CR>', {})
    vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>', {})
  end,
}
