vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Indentation
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

require("config.lazy")
require("config.local")
