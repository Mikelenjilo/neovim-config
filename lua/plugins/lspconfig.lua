return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "saghen/blink.cmp" },
  config = function()
    vim.diagnostic.config({ virtual_text = true })

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local lsp_keymaps = require("keymaps.lsp")

    -- Lua
    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },
        },
      },
    })

    -- Dart/Flutter
    vim.lsp.config("dartls", {
      cmd = { "dart", "language-server", "--protocol=lsp" },
      capabilities = capabilities,
    })

    -- Enable all configured servers
    vim.lsp.enable({ "lua_ls", "dartls" })

    -- Attach LSP keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        lsp_keymaps.setup(event)
      end,
    })
  end,
}

