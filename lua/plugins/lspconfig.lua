return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "saghen/blink.cmp" },
  config = function()
    vim.diagnostic.config({ virtual_text = true })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Configure Lua Language Server
    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- Configure Dart/Flutter Language Server
    vim.lsp.config("dartls", {
      cmd = { "dart", "language-server", "--protocol=lsp" },
      capabilities = capabilities,
    })

    -- Example: Python Language Server (if you use Python)
    -- vim.lsp.config("pyright", {
    --   capabilities = capabilities,
    -- })

    -- Example: TypeScript/JavaScript
    -- vim.lsp.config("ts_ls", {
    --   capabilities = capabilities,
    -- })

    -- Enable all configured servers
    vim.lsp.enable({ "lua_ls", "dartls" })

    -- Add keymaps for LSP
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end,
    })
  end,
}
