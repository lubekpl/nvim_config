vim.g.mapleader = ' '

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

require("lazy").setup("plugins", opts)

require("util/keymapper")

require("colorscheme")
require("keymapping")
require("options")
require("harpoon-config")
require("tabnine-config")

require("coc-settings")
require("lualine-config")
require("indent-blankline")
require("beacon-config")
