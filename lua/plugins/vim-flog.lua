return {
  "rbong/vim-flog",
  lazy = false,
  config = function()
    vim.keymap.set('n', '<leader>fg', ":Flog<CR>", { noremap = true, silent = true })
  end
}
