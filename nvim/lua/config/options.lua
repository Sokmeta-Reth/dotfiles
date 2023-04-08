local opt = vim.opt

-- leader must be set before lazy.nvim loads any plugin
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- ui
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.scrolloff = 8
opt.wrap = false

-- indentation
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- files
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- misc
opt.splitright = true
opt.splitbelow = true
opt.clipboard = "unnamedplus"
opt.updatetime = 250
