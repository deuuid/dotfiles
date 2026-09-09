vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.wrap = false

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

opt.timeoutlen = 400

opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmatch = true

opt.fileencodings = { "ucs-bom", "utf-8", "cp1251", "latin1" }
