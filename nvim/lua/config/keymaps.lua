local map = vim.keymap.set

-- Common C-c C-x C-v functionality with system clipboard
map("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })
map("v", "<C-x>", '"+c', { desc = "Cut to clipboard" })
map("v", "<C-v>", 'c<ESC>"+p', { desc = "Paste from clipboard" })
map("i", "<C-v>", "<C-r><C-o>+", { desc = "Paste from clipboard" })

-- Disable increase and decrease numbers
map("n", "<C-a>", "<Nop>")
map("n", "<C-x>", "<Nop>")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Strip trailing whitespace (,ss)
map("n", "<leader>ss", function()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
end, { desc = "Strip trailing whitespace" })

-- Spell in different languages
map("n", "<leader>CS", "<cmd>setlocal spell spelllang=es_es<CR>", { desc = "Spell Spanish" })
map("n", "<leader>CE", "<cmd>setlocal spell spelllang=en_us<CR>", { desc = "Spell English" })
map("n", "<leader>CF", "<cmd>setlocal spell spelllang=fr_fr<CR>", { desc = "Spell French" })
map("n", "<leader>NC", "<cmd>setlocal nospell<CR>", { desc = "Disable spell" })

-- Buffers
map("n", "<leader>T", "<cmd>enew<CR>", { desc = "New buffer" })
map("n", "<C-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<C-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bq", "<cmd>bp <BAR> bd #<CR>", { desc = "Close buffer" })
map("n", "<leader>bl", "<cmd>ls<CR>", { desc = "List buffers" })

-- Leave terminal mode (Claude terminal included) with a double escape
map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Count occurrences of a pattern
vim.api.nvim_create_user_command("Count", "%s/<args>//gn", { nargs = 1 })
