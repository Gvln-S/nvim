return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "clangd",
        "jdtls",
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "kotlin_language_server",
        "lemminx",
        "gradle_ls",
        "bashls",
        "marksman",
        "pyright",
      },
      automatic_installation = true,
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "mfussenegger/nvim-jdtls",
    },
    config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
			vim.lsp.handlers.hover, {
				border = "rounded"
			}
			)

      local default_config = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)

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
      }

      lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", default_config, {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      }))

      lspconfig.clangd.setup(vim.tbl_deep_extend("force", default_config, {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--query-driver=C:/ProgramData/mingw64/mingw64/bin/g++*",
        },
        capabilities = vim.tbl_deep_extend("force", capabilities, {
          offsetEncoding = { "utf-16" },
        }),
      }))

      lspconfig.kotlin_language_server.setup(vim.tbl_deep_extend("force", default_config, {
        root_dir = function(fname)
          return lspconfig.util.root_pattern('build.gradle.kts', 'settings.gradle.kts', '.git')(fname)
            or vim.fn.getcwd()
        end,
      }))

      lspconfig.ts_ls.setup(default_config)
      lspconfig.html.setup(default_config)
      lspconfig.cssls.setup(default_config)
      lspconfig.lemminx.setup(default_config)
      lspconfig.gradle_ls.setup(default_config)
      lspconfig.pyright.setup(default_config)
      lspconfig.bashls.setup(default_config)
      lspconfig.marksman.setup(default_config)

      vim.diagnostic.config({
        virtual_text = {
          prefix = '●',
          source = "always",
        },
        float = {
          source = "always",
          border = "rounded",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}
