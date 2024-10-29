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
  {
    'f-person/git-blame.nvim',
    opts = {
      enabled = false,
      date_format = '%y/%m/%d %H:%M:%S',
    },
    vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>")
  }
}
