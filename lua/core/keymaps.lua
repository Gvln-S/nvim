vim.keymap.set('n', '<C-h>', '<C-w>h', {})
vim.keymap.set('n', '<C-l>', '<C-w>l', {})
vim.keymap.set('n', '<S-Q>', '<Cmd>q<CR>')

vim.keymap.set("n", "<leader>wqa", ":wqa<CR>")
vim.keymap.set("n", "<leader>ww", ":w<CR>")

vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
vim.keymap.set("n", "<leader>sj", "<C-w>-5") -- make split window height shorter
vim.keymap.set("n", "<leader>sk", "<C-w>+5") -- make split windows height taller
vim.keymap.set("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger 
vim.keymap.set("n", "<leader>sh", "<C-w><5") -- make split windows width smaller

