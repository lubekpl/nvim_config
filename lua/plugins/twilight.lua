return {
  "folke/twilight.nvim",
  cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  keys = {
    { "<leader>tw", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
  },
  opts = {
    dimming = {
      alpha = 0.25,
      color = { "Normal", "#ffffff" },
      term_bg = "#000000",
      inactive = false,
    },
    context = 10,
    treesitter = true,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
      "class",
      "module",
      -- Ruby specific
      "method_definition",
      "class_definition",
      "module_definition",
      "block",
      "do_block",
    },
    exclude = {},
  },
}
