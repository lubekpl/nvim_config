vim.keymap.set("i", "jk", "<Esc>", options)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>r', builtin.treesitter, {})
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', '<leader>h', builtin.live_grep, {})

local mapkey = require("util.keymapper").mapkey

mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right

vim.keymap.set('n', '<leader>q', ':bufdo bd<Cr>')

-- vim-test
vim.keymap.set('n', '<leader>t', ':TestFile<Cr>')
vim.keymap.set('n', '<leader>s', ':TestNearest<Cr>')
vim.keymap.set('n', '<leader>l', ':TestLast<Cr>')
vim.keymap.set('n', '<leader>a', ':TestSuite<Cr>')
