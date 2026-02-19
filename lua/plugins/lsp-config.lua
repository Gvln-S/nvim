return {
  {
    "neovim/nvim-lspconfig",
    lazy = false, 
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup({ ui = { border = "rounded" } })

      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { noremap = true, silent = true, buffer = ev.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>df", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        end,
      })

      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls", "pyright" },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
          end,
          ["clangd"] = function()
            local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
            local cmd = is_windows and {
              "C:/msys64/mingw64/bin/clangd.exe", "--background-index", "--clang-tidy",
              "--query-driver=C:/msys64/mingw64/bin/clang++.exe"
            } or {
              "clangd", "--background-index", "--clang-tidy", "--fallback-style=llvm"
            }
            lspconfig.clangd.setup({
              cmd = cmd,
              capabilities = capabilities,
            })
          end,
        }
      })
    end,
  }
}
