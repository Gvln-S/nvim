local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  ui = {
    border = "rounded"
  },
  checker = { enabled = true },
})

local function make_lazy_transparent()
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "LazyNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "LazyBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "LazyH1", { bg = "none" })
  vim.api.nvim_set_hl(0, "LazyH2", { bg = "none" })
  vim.api.nvim_set_hl(0, "LazyButton", { bg = "none" })
  vim.api.nvim_set_hl(0, "LazyButtonActive", { bg = "none" })
end

make_lazy_transparent()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = make_lazy_transparent,
})

require("core.keymaps")
require("core.vim-options")
-- require("mason").setup()

local path = vim.fn.expand('$PATH')
vim.fn.setenv('PATH', path .. ';C:\\Program Files\\LLVM\\bin')
