local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
if is_windows then
  return {
    "lervag/vimtex",
    ft = { "tex" },
    config = function()
      vim.g.vimtex_view_method = "general"
      vim.g.vimtex_view_general_viewer = 'C:/Users/Gvln-S/AppData/Local/SumatraPDF/SumatraPDF.exe'
      vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  }
end
