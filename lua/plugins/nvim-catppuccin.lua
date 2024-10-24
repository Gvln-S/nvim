return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
			transparent_background = true,
      term_colors = true,
      integrations = {
        cmp = true,
				treesitter = true,
        lsp_saga = true,
        gitsigns = true,
      },
      styles = {
        comments = { "italic" },
        keywords = { "bold" },
      },
    })
    vim.cmd.colorscheme 'catppuccin'
  end
}
