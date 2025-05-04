require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find Files" })

map({ 'v', 'n' }, '<C-c>', '"+y', { desc = 'Copy to clipboard' })
map({ 'i', 'n', 'v' }, '<C-v>', '<C-r>+', { desc = 'Paste from clipboard' })
