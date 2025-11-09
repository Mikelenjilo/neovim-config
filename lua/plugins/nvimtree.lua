return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
      require("keymaps.nvimtree")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },
}

