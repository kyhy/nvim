-- my shit
local opts = { noremap = true }

-- pane splits
vim.keymap.set('n', '<leader>\\', '<C-w>v', opts)
vim.keymap.set('n', '<leader>-', '<C-w>s', opts)
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>ps', ':PackerSync<CR>')

-- easymotion
vim.keymap.set('n', 's', '<Plug>(easymotion-s)')
vim.g.EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

-- RIP esc key
vim.keymap.set('i', 'jj', '<ESC>')

-- from primeagen
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "J", "mzJ`z") -- keep cursor inplace while J

-- keep cursor in middle of page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search term in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep paste buffer text and send replaced text to void
-- vim.keymap.set("x", "<leader>p", "\"_dP")

-- keep copy buffer separate between vim and system
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")

-- send deleted text to void. Doesn't work?
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- prevent going to worst place in the universe
vim.keymap.set("n", "Q", "<nop>")

-- does not work
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.keymap.set("n", "<leader>f", function()
--     vim.lsp.buf.format()
-- en{ previewer = false { previewer = false })

-- lsp quick fix shit
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
