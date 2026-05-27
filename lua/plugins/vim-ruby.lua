return {
  "vim-ruby/vim-ruby",
  ft = { "ruby", "eruby" },
  init = function()
    -- Ruby indentation settings
    vim.g.ruby_indent_access_modifier_style = "indent"
    vim.g.ruby_indent_assignment_style = "variable"
    vim.g.ruby_indent_block_style = "do"
    vim.g.ruby_indent_hanging_elements = 0

    -- Enable Ruby-specific text objects
    vim.g.ruby_no_expensive = 0

    -- Highlight operators
    vim.g.ruby_operators = 1
    vim.g.ruby_space_errors = 1
    vim.g.ruby_spellcheck_strings = 1
  end,
}
