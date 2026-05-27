return {
  "ellisonleao/glow.nvim",
  cmd = "Glow",
  ft = { "markdown" },
  keys = {
    { "<leader>mp", "<cmd>Glow<cr>", desc = "Markdown Preview (Glow)" },
  },
  opts = {
    border = "rounded",
    width_ratio = 0.8,
    height_ratio = 0.8,
  },
}
