vim.keymap.set("i", "jk", "<Esc>", options)

-- Telescope things
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc="fuzzy finder"})
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc="buffers"})
vim.keymap.set('n', '<leader>r', builtin.treesitter, { desc="tags"})
vim.keymap.set('n', '<leader>g', builtin.git_files, {desc="git files"})
vim.keymap.set('n', '<leader>h', builtin.live_grep, {desc="grep"})
vim.keymap.set('n', '<leader>c', builtin.colorscheme, {desc="switch colors"})
vim.keymap.set('n', '<leader>/', function()
-- You can pass additional configuration to telescope to change theme, layout, etc.
require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	winblend = 10,
	previewer = false,
})
end, { desc = '[/] Fuzzily search in current buffer]' })

require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap(
  "n",
  "<space>ns",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>na",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
require("telescope").load_extension("ag")
------------------------------------------------------------------------- telescope

local mapkey = require("util.keymapper").mapkey

mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right

-- close all buffers with leader-q
vim.keymap.set('n', '<leader>q', ':bufdo bd<Cr>', { desc = "Close all buffers" })

-- vim-test
vim.keymap.set('n', '<leader>t', ':TestFile<Cr>', { desc = "Test file" })
vim.keymap.set('n', '<leader>s', ':TestNearest<Cr>', { desc = "Test near" })
vim.keymap.set('n', '<leader>l', ':TestLast<Cr>', { desc = "Test last" })
vim.keymap.set('n', '<leader>a', ':TestSuite<Cr>', { desc = "Test all" })

-- remap u/U for undo/redo
vim.api.nvim_set_keymap('n', 'U', '<C-R>', { noremap = true })

local map = vim.api.nvim_set_keymap

-- remap esc in terminal to jump to normal mode
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true }) -- Terminal mode

-- split on ss sv
-- map("n", "ss", ":split<Return>", { noremap = true, silent = true })
-- map("n", "sv", ":vsplit<Return>", { noremap = true, silent = true })

-- neogen, generate annotations
vim.keymap.set("n", "<Leader>nf", ":lua require('neogen').generate()<CR>",
               { noremap = true, silent = true, desc = "Generate annotations for funciton" })
