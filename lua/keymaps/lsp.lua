local M = {}

function M.setup(event)
  local opts = { buffer = event.buf }
  local map = vim.keymap.set

  -- 📚 Navigation
  map("n", "gd", vim.lsp.buf.definition, opts)        -- Go to definition
  map("n", "gD", vim.lsp.buf.declaration, opts)       -- Go to declaration
  map("n", "gr", vim.lsp.buf.references, opts)        -- List references
  map("n", "gi", vim.lsp.buf.implementation, opts)    -- Go to implementation
  map("n", "gt", vim.lsp.buf.type_definition, opts)   -- Go to type definition

  -- 💡 Code Actions & Refactoring
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
  map("v", "<leader>ca", vim.lsp.buf.code_action, opts) -- Visual mode actions
  map("n", "<leader>rn", vim.lsp.buf.rename, opts)      -- Rename symbol

  -- 🧠 Info & Hover
  map("n", "K", vim.lsp.buf.hover, opts)                -- Hover docs
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts) -- Signature help

  -- 🔧 Diagnostics
  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)
  map("n", "<leader>e", vim.diagnostic.open_float, opts)
  map("n", "<leader>q", vim.diagnostic.setloclist, opts)

  -- 🧹 Source actions (organize imports, fix all, etc.)
  map("n", "<leader>oi", function()
    vim.lsp.buf.code_action({ only = { "source.organizeImports" }, apply = true })
  end, opts)
  map("n", "<leader>fa", function()
    vim.lsp.buf.code_action({ only = { "source.fixAll" }, apply = true })
  end, opts)

  -- 🔄 Format
  map("n", "<leader>fm", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

return M


