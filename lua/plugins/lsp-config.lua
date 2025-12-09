return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "mfussenegger/nvim-jdtls",
    },
    config = function()
      -- 1. Mason Base
      require("mason").setup({
        ui = { border = "rounded" }
      })

      -- 2. Preparar configuración común (Capabilities y Atajos)
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Configuración visual
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.diagnostic.config({
        virtual_text = { prefix = '●', source = "always" },
        float = { source = "always", border = "rounded" },
        signs = true, underline = true, update_in_insert = false, severity_sort = true,
      })

      -- Esta función se ejecutará cada vez que se conecte un servidor
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>df", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        
        if client.name ~= "null-ls" then
          client.server_capabilities.documentFormattingProvider = false
        end
      end

      local default_config = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- 3. Mason LSPConfig (LA SOLUCIÓN)
      -- En lugar de llamar a setup_handlers aparte, pasamos la tabla 'handlers' aquí dentro.
      require("mason-lspconfig").setup({
        ensure_installed = {
          "jdtls", "lua_ls", "ts_ls", "html", "cssls", 
          "kotlin_language_server", "bashls", "marksman", 
          "pyright", "clangd"
        },
        automatic_installation = true,
        
        -- AQUI ESTA LA CLAVE: Los handlers van dentro del setup
        handlers = {
          -- Handler por defecto (para la mayoría de servidores)
          function(server_name)
            if server_name ~= "jdtls" then
              lspconfig[server_name].setup(default_config)
            end
          end,

          -- Handler específico para LUA
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", default_config, {
              settings = {
                Lua = {
                  runtime = { version = 'LuaJIT' },
                  diagnostics = { globals = { "vim" } },
                  workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
                  telemetry = { enable = false },
                },
              },
            }))
          end,

          -- Handler específico para CLANGD
          ["clangd"] = function()
            local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
            local cmd = is_windows and {
              "C:/msys64/mingw64/bin/clangd.exe", "--background-index", "--clang-tidy",
              "--header-insertion=iwyu", "--completion-style=detailed", "--function-arg-placeholders",
              "--fallback-style=llvm", "--query-driver=C:/msys64/mingw64/bin/clang++.exe"
            } or {
              "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu",
              "--completion-style=detailed", "--function-arg-placeholders", "--fallback-style=llvm",
              "--query-driver=/usr/bin/*"
            }
            lspconfig.clangd.setup(vim.tbl_deep_extend("force", default_config, {
              cmd = cmd,
              capabilities = vim.tbl_deep_extend("force", capabilities, { offsetEncoding = { "utf-16" } }),
            }))
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
