-- Disable netrw (recommended before loading nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit color (for better themes)
vim.opt.termguicolors = true

-- My configs
vim.wo.relativenumber = true
vim.g.mapleader = " " -- set <leader> to space

-- Load Lazy.nvim (plugin manager)
require("config.lazy")

-- Setup plugins (loads all specs in lua/plugins/)
require("lazy").setup("plugins")

-- Load colorscheme
vim.cmd("colorscheme ayu-dark")


