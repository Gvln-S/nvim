vim.keymap.set('n', '<C-h>', '<C-w>h', {})
vim.keymap.set('n', '<C-l>', '<C-w>l', {})
vim.keymap.set('n', '<S-Q>', '<Cmd>q<CR>')

vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>ww", ":w<CR>")

vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
vim.keymap.set("n", "<leader>sj", "<C-w>-") -- make split window height shorter
vim.keymap.set("n", "<leader>sk", "<C-w>+") -- make split windows height taller
vim.keymap.set("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger 
vim.keymap.set("n", "<leader>sh", "<C-w><5") -- make split windows width smaller

