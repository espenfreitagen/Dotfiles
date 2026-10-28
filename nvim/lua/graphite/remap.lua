local keymap = vim.keymap.set
vim.g.mapleader = " "

keymap("n", "<leader>q", vim.cmd.q)
keymap("n", "<leader>bd", vim.cmd.bd)
keymap("n", "<leader>w", vim.cmd.w)

keymap("n", "<leader>fe", vim.cmd.Ex)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap("n", "<leader>fn", "<cmd>Telescope grep_string<CR>")
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("x", "<leader>p", [["_dP]])

keymap("n", "<leader>y", "\"+y")
keymap("v", "<leader>y", "\"+y")
keymap("n", "<leader>Y", "\"+Y")

keymap("n", "<leader>d", "\"_d")
keymap("v", "<leader>d", "\"_d")

keymap("n", "<leader>p", "\"+p")

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
keymap("n", "<leader>c", "<cmd>!gcc %<CR>", { silent = true })
keymap("n", "<leader>xc", "<cmd>!./a.out %<CR>")

keymap("n", "<leader>n", "<cmd>nohl<CR>")

keymap("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
keymap("n", "gi", vim.lsp.buf.implementation)
keymap("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
