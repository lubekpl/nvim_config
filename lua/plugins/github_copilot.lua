--[[
return {
  {
    "github/copilot.vim"
  }
}
]]

return {
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Copilot settings
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      
      -- Key mappings
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.g.copilot_filetypes = {
        ["*"] = false,
        ["javascript"] = true,
        ["typescript"] = true,
        ["lua"] = true,
        ["rust"] = true,
        ["c"] = true,
        ["cpp"] = true,
        ["go"] = true,
        ["python"] = true,
        ["ruby"] = true,
        ["terraform"] = true,
      }
    end
  }
}
