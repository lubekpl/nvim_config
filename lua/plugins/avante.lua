return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("avante").setup({
        -- Set Copilot as the provider
        provider = "copilot",
        
        -- Configure the UI
        ui = {
          width = 80,
          height = 20,
          position = "right",
        },
        
        -- Configure Copilot integration
        selector = {
          exclude_auto_select = { "NvimTree" },
        },
        
        -- Configure the chat
        chat = {
          model = "claude-sonnet-3.7",  -- Uncomment to switch to Claude 3.7 Sonnet
          -- model = "gpt-4.5",  -- Defaulting to Claude 3.7 Sonnet or GPT-4.5
          temperature = 0.7,
          max_tokens = 4000,
        },
      })

      -- Set up key mappings after the module is loaded
      vim.keymap.set({ "n", "v" }, "<leader>ae", function()
        require("avante").edit()
      end, { desc = "Edit with Avante" })

      vim.keymap.set("n", "<leader>ap", function()
        require("avante").toggle()
      end, { desc = "Toggle Avante planning mode" })

      vim.keymap.set("n", "<leader>as", function()
        require("avante").get_suggestion():suggest()
      end, { desc = "Get Avante suggestions" })

      -- Filetype-specific mappings for NvimTree
      local function setup_nvimtree_mappings()
        if vim.bo.filetype == "NvimTree" then
          vim.keymap.set("n", "<leader>a+", function()
            local tree_ext = require("avante.extensions.nvim_tree")
            tree_ext.add_file()
          end, { desc = "Select file in NvimTree", buffer = true })

          vim.keymap.set("n", "<leader>a-", function()
            local tree_ext = require("avante.extensions.nvim_tree")
            tree_ext.remove_file()
          end, { desc = "Deselect file in NvimTree", buffer = true })
        end
      end

      -- Set up NvimTree mappings when entering NvimTree buffer
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "NvimTree",
        callback = setup_nvimtree_mappings,
      })
    end,
  },
} 
