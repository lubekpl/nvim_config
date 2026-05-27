return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
  },
  opts = {
    window = {
      backdrop = 0.95,
      width = 120,
      height = 1,
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
    },
    on_open = function(win)
      -- Disable scrollview in zen mode if present
      pcall(function() require("scrollview").disable() end)
    end,
    on_close = function()
      -- Re-enable scrollview when exiting zen mode
      pcall(function() require("scrollview").enable() end)
    end,
  },
}
