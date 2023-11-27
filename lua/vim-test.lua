-- map <Leader>t :TestFile<CR>
-- map <Leader>s :TestNearest<CR>
-- map <Leader>l :TestLast<CR>
-- map <Leader>a :TestSuite<CR>
--
vim.keymap.set("n", "<Leader>t", ":TestFile<CR>")
-- vim.keymap.set('n', '<Leader>w', ':write<CR>')
--
vim.cmd [[
map <Leader>t :TestFile<CR>
]]
