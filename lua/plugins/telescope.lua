return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "▶ ",
        path_display = {"truncate"},
        file_ignore_patterns = { "node_modules", ".git/" },
      },
      pickers = {
        find_files = {
          hidden = true
        }
      }
    })

    -- Load FZF extension safely
    pcall(function()
      telescope.load_extension('fzf')
    end)
  end
}
