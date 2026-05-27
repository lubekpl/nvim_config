return {
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },
  {
    -- Keep nvim-lspconfig for server configs (cmd, filetypes, root_markers)
    -- but use vim.lsp.config/enable for setup
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Enhanced capabilities with cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Set default capabilities for all LSP servers
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Ruby LSP configuration
      vim.lsp.config("ruby_lsp", {
        cmd = { "ruby-lsp" },
        filetypes = { "ruby" },
        root_markers = { "Gemfile", ".git" },
      })

      -- Solargraph configuration
      vim.lsp.config("solargraph", {
        cmd = { "solargraph", "stdio" },
        filetypes = { "ruby" },
        root_markers = { "Gemfile", ".git" },
        settings = {
          solargraph = {
            diagnostics = true,
          },
        },
      })

      -- Enable servers (they will auto-start when matching filetypes open)
      -- ruby_lsp requires Ruby 3.2+ (bundler 2.7+ dependency)
      -- vim.lsp.enable("ruby_lsp")
      vim.lsp.enable("solargraph")

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