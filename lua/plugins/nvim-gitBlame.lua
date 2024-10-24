return {
  'f-person/git-blame.nvim',
  opts = {
    enabled = false,
		date_format = '%y/%m/%d %H:%M:%S',
	},
	vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>")
}
