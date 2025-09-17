return {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Setup mini modules safely
      local modules = {
        'ai', 'surround', 'splitjoin', 'comment', 'move'
      }

      for _, module in ipairs(modules) do
        pcall(function()
          require('mini.' .. module).setup()
        end)
      end

      -- Setup statusline safely
      pcall(function()
        local statusline = require('mini.statusline')
        statusline.setup({ use_icons = true })
      end)

      -- Skip problematic modules that might cause insert mode issues
      -- mini.pairs and mini.animate disabled temporarily
    end,
  },
}