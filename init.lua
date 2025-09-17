vim.g.mapleader = "\\"

vim.api.nvim_set_keymap('n', '<Space>', '<leader>', {})
vim.api.nvim_set_keymap('v', '<Space>', '<leader>', {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins",opts)

-- Load error handling first to suppress autocommand errors
require("error-handling")

-- Map tab to accept autocomplete suggestions
vim.api.nvim_set_keymap('i', '<Tab>', "copilot#Accept('<Tab>')", { noremap = true, silent = true, expr = true })

require("util/keymapper")

require("colorscheme")
require("keymapping")
require("options")

require("harpoon-config")
require("lualine-config")
require("indent-blankline")
require("beacon-config")
require("smartcolumn").setup()
require("focus-config")
require("scrollview-config")
require("notify-config")
require("noice-config")
