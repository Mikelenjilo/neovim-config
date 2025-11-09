return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "dart", "yaml", "json" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

