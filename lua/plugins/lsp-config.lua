return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
         ui = {
        border = "rounded" 
    }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
      }) 
    end,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.jdtls.setup({
        capabilities = capabilities,
        root_dir = function(fname)
          return lspconfig.util.root_pattern('pom.xml', 'build.gradle', '.git')(fname) or vim.fn.getcwd()
        end,
        cmd = {'C:\\Users\\santi\\AppData\\Local\\nvim-data\\mason\\bin\\jdtls.CMD'},
        on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false 
        end,
      })
      lspconfig.kotlin_language_server.setup({
        capabilities = capabilities,
        root_dir = function(fname)
          return lspconfig.util.root_pattern('build.gradle.kts', 'settings.gradle.kts', '.git')(fname) or vim.fn.getcwd()
        end,
        cmd = {'C:\\Users\\santi\\AppData\\Local\\nvim-data\\mason\\bin\\kotlin-language-server.CMD'},
        on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false 
        end,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.lemminx.setup({
        capabilities = capabilities
      })
      lspconfig.gradle_ls.setup({
        capabilities = capabilities
      })
      lspconfig.css_variables.setup({
        capabilities = capabilities
      })
      lspconfig.ast_grep.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          if vim.bo.filetype == "java" then
            client.stop()
          end
          if vim.bo.filetype == "kts" then
            client.stop()
          end

        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>df", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

    end,
  },
}

