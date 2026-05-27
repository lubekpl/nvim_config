-- Modern Lua rewrite of vim-surround with better integration
-- Keeps vim-surround installed as fallback
return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  opts = {
    -- Default keymaps (v4 uses defaults automatically):
    -- ys{motion}{char} - add surround
    -- ds{char} - delete surround
    -- cs{target}{replacement} - change surround
    -- yss{char} - surround entire line
    -- Visual mode: S{char} - surround selection
    surrounds = {
      -- Custom surrounds for Ruby
      ["#"] = {
        add = { "#{", "}" },
        find = "#{.-}",
        delete = "^(#{)().-(})()$",
      },
      -- ERB tags
      ["="] = {
        add = { "<%= ", " %>" },
        find = "<%=.-%%>",
        delete = "^(<%= )().-( %%>)()$",
      },
      ["-"] = {
        add = { "<% ", " %>" },
        find = "<%%.-%%>",
        delete = "^(<%% )().-( %%>)()$",
      },
    },
    aliases = {
      ["a"] = ">",
      ["b"] = ")",
      ["B"] = "}",
      ["r"] = "]",
      ["q"] = { '"', "'", "`" },
      -- ["s"] = { "}", "]", ")", ">", '"', "'", "`" }, -- disabled to keep native s
    },
    highlight = {
      duration = 200,
    },
    move_cursor = "begin",
  },
}
