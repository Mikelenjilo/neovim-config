return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<leader>t]],
      direction = "horizontal",
      start_in_insert = true,
      shade_terminals = true,
      size = 12,
    })

    -- Load terminal-specific keymaps
    require("keymaps.terminal").setup()
  end,
}
