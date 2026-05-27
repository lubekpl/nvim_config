return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  -- Note: <leader>cf for manual format is defined in keymapping.lua
  -- Format on save is enabled below, so manual formatting is rarely needed
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      vue = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      less = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      jsonc = { { "prettierd", "prettier" } },
      yaml = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      graphql = { { "prettierd", "prettier" } },
      handlebars = { "prettier" },
      ruby = { "rubocop" },
      go = { "goimports", "gofmt" },
      rust = { "rustfmt" },
      terraform = { "terraform_fmt" },
      hcl = { "terraform_fmt" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
    },
    default_format_opts = {
      lsp_fallback = true,
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_fallback = true,
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}