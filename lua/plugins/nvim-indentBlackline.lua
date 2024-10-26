return {
  "lukas-reineke/indent-blankline.nvim",
  event = 'VeryLazy',
  main = "ibl",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "html",
      callback = function()
        require("ibl").setup({
          enabled = true,
          indent = { char = '|' },
          scope = { enabled = false },
        })
      end,
    })
  end,
}
