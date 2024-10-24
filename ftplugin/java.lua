local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

local home = vim.fn.expand('$USERPROFILE')
local workspace_path = home .. '\\AppData\\Local\\nvim-data\\workspace\\' .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local mason_path = vim.fn.expand('$USERPROFILE') .. '\\AppData\\Local\\nvim-data\\mason'
local config = {
  capabilities = capabilities,
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', vim.fn.glob(mason_path .. '\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_*.jar'),
    '-configuration', mason_path .. '\\packages\\jdtls\\config_win',
    '-data', workspace_path,
  },
  root_dir = root_dir,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.Assume.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.junit.jupiter.api.Assumptions.*",
          "org.junit.jupiter.api.DynamicContainer.*",
          "org.junit.jupiter.api.DynamicTest.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org"
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
      },
      configuration = {
        runtimes = {
          {
            vim.lsp.set_log_level("debug"),
            name = "JavaSE-23",
            path = "C:\\Program Files\\Java\\jdk-23",
          },
        }
      }
    },
  },
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, opts)
    vim.keymap.set("n", "<leader>ev", jdtls.extract_variable, opts)
    vim.keymap.set("n", "<leader>ec", jdtls.extract_constant, opts)
    vim.keymap.set("v", "<leader>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>df", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end,
}

jdtls.start_or_attach(config)
