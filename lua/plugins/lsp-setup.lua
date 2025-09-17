return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Use basic LSP capabilities without cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Setup gem-installed Ruby servers
      pcall(function()
        lspconfig.ruby_lsp.setup({
          capabilities = capabilities,
          cmd = { "ruby-lsp" },
          filetypes = { "ruby" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
        })
      end)

      pcall(function()
        lspconfig.solargraph.setup({
          capabilities = capabilities,
          cmd = { "solargraph", "stdio" },
          filetypes = { "ruby" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
          settings = {
            solargraph = {
              diagnostics = true,
            },
          },
        })
      end)

      -- LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end,
      })
    end,
  },
}