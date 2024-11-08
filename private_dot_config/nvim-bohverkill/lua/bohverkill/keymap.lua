vim.g.mapleader = ' '

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever: ThePrimeagen
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever: asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.api.nvim_set_keymap('c', 'W', 'w', {})
vim.api.nvim_set_keymap('c', 'X', 'x', {})
vim.api.nvim_set_keymap('c', 'Q', 'q', {})

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')


vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<leader>bn", '<cmd>bnext<CR>')
vim.keymap.set("n", "<leader>bp", '<cmd>bprevious<CR>')
vim.keymap.set("n", "<leader>bd", '<cmd>bdelete<CR>')

-- netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
