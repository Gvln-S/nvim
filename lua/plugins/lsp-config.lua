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

      vim.diagnostic.config({
        virtual_text = {
          prefix = '●',
          source = "always",
        },
        float = { 
          source = "always",
          border = "rounded"
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

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
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.name ~= "null-ls" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end,
      })

      require("mason-lspconfig").setup({
        ensure_installed = { 
          "jdtls", "lua_ls", "ts_ls", "html", "cssls", 
          "kotlin_language_server", "bashls", "marksman", 
          "pyright", "clangd" 
        },
        automatic_installation = true,
        handlers = {
          function(server_name)
            if server_name ~= "jdtls" then
              lspconfig[server_name].setup({ capabilities = capabilities })
            end
          end,

          ["clangd"] = function()
            local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
            local cmd = is_windows and {
              "C:/msys64/mingw64/bin/clangd.exe",
              "--background-index",
              "--clang-tidy",
              "--header-insertion=iwyu",
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=llvm",
              "--query-driver=C:/msys64/mingw64/bin/clang++.exe"
            } or {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--header-insertion=iwyu",
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=llvm",
              "--query-driver=/usr/bin/*"
            }

            lspconfig.clangd.setup({
              cmd = cmd,
              capabilities = vim.tbl_deep_extend("force", capabilities, { offsetEncoding = { "utf-16" } }),
            })
          end,
        }
      })
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
}
