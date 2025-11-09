-- Toggle tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle file explorer" })

-- Switch between nvim-tree and code window
vim.keymap.set('n', '<C-Left>', '<C-w><Left>', defaults)
vim.keymap.set('n', '<C-Right>', '<C-w><Right>', defaults)


-- Toggle tree with file location
vim.keymap.set('n', '<leader>o', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true, desc = "Reveal file in tree" })
