return {
  "mrjones2014/legendary.nvim",
  priority = 10000,
  lazy = false,
  dependencies = { "kkharji/sqlite.lua" },
  keys = {
    { "<leader>p", "<cmd>Legendary<cr>", desc = "Command palette" },
    { "<leader>pk", "<cmd>Legendary keymaps<cr>", desc = "Search keymaps" },
    { "<leader>pc", "<cmd>Legendary commands<cr>", desc = "Search commands" },
    { "<leader>pf", "<cmd>Legendary functions<cr>", desc = "Search functions" },
  },
  opts = {
    extensions = {
      lazy_nvim = true,
      which_key = {
        auto_register = true,
        do_binding = false,
      },
    },
    -- Include built-in keymaps
    include_builtin = true,
    -- Include legendary.nvim's own keymaps
    include_legendary_cmds = true,
    select_prompt = " Legendary ",
    -- Customize the formatter
    col_separator_char = "│",
    -- Icons
    icons = {
      keymap = "",
      command = "",
      fn = "󰊕",
      itemgroup = "",
    },
    -- Sort items by frecency (most used first)
    sort = {
      frecency = {
        db_root = vim.fn.stdpath("data") .. "/legendary",
        max_timestamps = 20,
      },
    },
  },
}
