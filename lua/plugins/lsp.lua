return {
  -- modern symbols outline
  {
    "stevearc/aerial.nvim",
    cmd = "AerialToggle",
    keys = { { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Symbols Outline (Aerial)" } },
    opts = {
      backends = { "treesitter", "lsp", "markdown", "man" },
      layout = {
        default_direction = "prefer_right",
        placement = "window",
      },
      attach_mode = "window",
      keymaps = {
        ["?"] = "actions.show_help",
        ["<CR>"] = "actions.jump",
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["q"] = "actions.close",
        ["o"] = "actions.tree_toggle",
        ["l"] = "actions.tree_open",
        ["h"] = "actions.tree_close",
      },
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      },
      highlight_mode = "split_width",
      highlight_closest = true,
      float = {
        border = "rounded",
        relative = "cursor",
        max_height = 0.9,
      },
    },
  },
}
