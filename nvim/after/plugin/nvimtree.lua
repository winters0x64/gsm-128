require("nvim-tree").setup()

vim.keymap.set('n','<leader>tt',vim.cmd.NvimTreeToggle)
vim.keymap.set('n','<leader>t',vim.cmd.NvimTreeFocus)

