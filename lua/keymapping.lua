vim.keymap.set("i", "jk", "<Esc>", options)

-- Telescope things
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc="fuzzy finder"})
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc="buffers"})
vim.keymap.set('n', '<leader>r', builtin.treesitter, { desc="tags"})
vim.keymap.set('n', '<leader>g', builtin.git_files, {desc="git files"})
vim.keymap.set('n', '<leader>h', builtin.live_grep, {desc="grep"})
-- Organize 'c' prefix for code-related actions
vim.keymap.set('n', '<leader>cc', builtin.colorscheme, {desc="switch colors"})
vim.keymap.set('n', '<leader>cs', '<cmd>AerialToggle<cr>', {desc="symbols outline"})
vim.keymap.set('n', '<leader>cf', function() require("conform").format({async=true}) end, {desc="format code"})
vim.keymap.set('n', '<leader>cr', function()
  if vim.lsp.buf.server_ready() then
    builtin.lsp_references()
  else
    builtin.grep_string({search = vim.fn.expand("<cword>")})
  end
end, {desc="find references"})
vim.keymap.set('n', '<leader>cd', function()
  if vim.lsp.buf.server_ready() then
    builtin.lsp_definitions()
  else
    builtin.treesitter({default_text = vim.fn.expand("<cword>")})
  end
end, {desc="go to definition"})
vim.keymap.set('n', '<leader>/', function()
-- You can pass additional configuration to telescope to change theme, layout, etc.
require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	winblend = 10,
	previewer = false,
})
end, { desc = '[/] Fuzzily search in current buffer]' })

-- File navigation with Oil.nvim (replacing telescope file browser)
vim.keymap.set('n', '<leader>no', ':Oil<CR>', { desc = 'Oil file explorer' })
vim.keymap.set('n', '<leader>nf', ':Oil %:p:h<CR>', { desc = 'Oil current file dir' })
require("telescope").load_extension("ag")

require("telescope").load_extension("tmuxinator")
vim.api.nvim_set_keymap(
  "n",
  "<space>t",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

vim.keymap.set('n', '<leader>nt', function()
require('telescope').extensions.tmuxinator.projects(require('telescope.themes').get_dropdown({}))
end, { desc = 'tmuxinator' })
------------------------------------------------------------------------- telescope

local mapkey = require("util.keymapper").mapkey

mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right

-- close all buffers with leader-q
vim.keymap.set('n', '<leader>q', ':bufdo bd<Cr>', { desc = "Close all buffers" })

-- vim-test
vim.keymap.set('n', '<leader>st', ':TestFile<Cr>', { desc = "Test file" })
vim.keymap.set('n', '<leader>ss', ':TestNearest<Cr>', { desc = "Test near" })
vim.keymap.set('n', '<leader>sl', ':TestLast<Cr>', { desc = "Test last" })
vim.keymap.set('n', '<leader>sa', ':TestSuite<Cr>', { desc = "Test all" })

-- remap u/U for undo/redo
vim.api.nvim_set_keymap('n', 'U', '<C-R>', { noremap = true })

local map = vim.api.nvim_set_keymap

-- remap esc in terminal to jump to normal mode
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true }) -- Terminal mode

-- split on ss sv
-- map("n", "ss", ":split<Return>", { noremap = true, silent = true })
-- map("n", "sv", ":vsplit<Return>", { noremap = true, silent = true })

-- neogen, generate annotations
vim.keymap.set("n", "<Leader>ng", ":lua require('neogen').generate()<CR>",
               { noremap = true, silent = true, desc = "Generate annotations" })
