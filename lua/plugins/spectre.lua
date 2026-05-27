return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ns", function() require("spectre").toggle() end, desc = "Search/Replace" },
    { "<leader>nd", function() require("spectre").open_visual({ select_word = true }) end, desc = "Search word", mode = { "n", "v" } },
  },
  opts = {
    open_cmd = "noswapfile vnew",
    live_update = true,
    is_insert_mode = false,
    mapping = {
      ["toggle_line"] = {
        map = "dd",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle item",
      },
      ["enter_file"] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "open file",
      },
      ["send_to_qf"] = {
        map = "<leader>q",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send to quickfix",
      },
      ["replace_cmd"] = {
        map = "<leader>c",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = "input replace command",
      },
      ["run_current_replace"] = {
        map = "<leader>rc",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        desc = "replace current line",
      },
      ["run_replace"] = {
        map = "<leader>R",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all",
      },
    },
  },
}
