local M = {}

function M.setup()
  local map = vim.keymap.set

  -- Exit terminal mode with <Esc>
  map('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })

  -- Move between windows while in terminal mode
  map('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = "Move to left window" })
  map('t', '<C-l>', [[<C-\><C-n><C-w>l]], { desc = "Move to right window" })
  map('t', '<C-j>', [[<C-\><C-n><C-w>j]], { desc = "Move to bottom window" })
  map('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = "Move to top window" })
end

return M

