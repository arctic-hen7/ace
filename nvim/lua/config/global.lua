--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false -- Already in statusbar
vim.opt.undofile = true
vim.opt.backupcopy = "yes"
vim.opt.signcolumn = "yes"

-- Splits
vim.opt.splitbelow = true
-- Fonts
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Use the system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Completion
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
