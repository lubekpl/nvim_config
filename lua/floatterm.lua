-- remap esc to ctrl \ ctrl n in terminal mode so you can close the terminal
-- pane and come back to it
-- vim.keymap.set('t', '<Esc>', "[[<C-\><C-n>]]")
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]],{noremap=true})
