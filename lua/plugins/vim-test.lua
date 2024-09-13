return {
  'vim-test/vim-test',
  config = function ()
    vim.g['test#java#runner'] = 'maven'

    vim.api.nvim_set_keymap('n', '<leader>t', ':TestNearest<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>T', ':TestFile<CR>', { noremap = true, silent = true })
  end
}
