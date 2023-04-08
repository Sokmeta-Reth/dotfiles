local map = vim.keymap.set

-- clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>w") -- cycle windows (editor <-> neo-tree)
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- move selected lines
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

-- keep cursor centred
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- paste without clobbering the register
map("x", "<leader>p", [["_dP]])
