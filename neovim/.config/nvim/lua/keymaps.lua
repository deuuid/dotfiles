local map = vim.keymap.set

map({ "n", "x" }, "<Space>", "<Nop>", { silent = true })

map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
map("n", "<leader>e", "<cmd>Ex<cr>", { desc = "File explorer (netrw)" })
map("n", "<leader>?", function() require("which-key").show({ global = false }) end, { desc = "Buffer keymaps" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
