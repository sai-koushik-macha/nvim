local g = vim.g
local o = vim.o
local wo = vim.wo
local opt = vim.opt

g.exrc = true

o.guicursor = ""
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.clipboard = "unnamedplus"
o.mouse = "a"
o.swapfile = false
o.writebackup = false
o.cmdheight = 2
o.signcolumn = "yes"
o.colorcolumn = "80"
o.updatetime = 50
o.wildmenu = true
o.wildmode = "full"
o.autowrite = true
o.wrap = false
o.errorbells = false
o.laststatus = 3
o.hlsearch = false
o.incsearch = true

opt.path = opt.path + "**"
opt.undofile = true

wo.number = true
wo.relativenumber = true
