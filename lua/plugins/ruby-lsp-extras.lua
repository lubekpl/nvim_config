-- Additional Ruby LSP enhancements
-- Note: Main ruby-lsp setup is in lsp-setup.lua
return {
  "mihyaeru21/nvim-ruby-lsp",
  ft = "ruby",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    -- This plugin adds additional features for ruby-lsp
    -- including better code lens support and inlay hints
    local ok, ruby_lsp = pcall(require, "ruby-lsp")
    if ok then
      ruby_lsp.setup({
        -- Enable experimental features
        enableExperimentalFeatures = true,
      })
    end
  end,
}
