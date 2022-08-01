vim.keymap.set("", "<C-\\>", ":NvimTreeFindFileToggle<CR>", { silent = true })
vim.keymap.set("", "<C-s>", ":Reload<CR>", { noremap = true })
vim.keymap.set("n", "<C-f>", ":FormatWrite<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>w", "<C-w>", { noremap = true })
vim.keymap.set("", "<C-w>", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("", "<C-n>", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("", "<C-p>", ":bp<CR>", { noremap = true, silent = true })
vim.keymap.set("", "L", "J", { noremap = true })
vim.keymap.set("", "J", "<C-d>", { noremap = true })
vim.keymap.set("", "K", "<C-u>", { noremap = true })
vim.keymap.set("", "<C-k>", "<C-y>", { noremap = true })
vim.keymap.set("", "<C-j>", "<C-e>", { noremap = true })
vim.keymap.set("", "<C-e>", "$", { noremap = true })
vim.keymap.set("", "<C-a>", "0", { noremap = true })

-- telescope
vim.keymap.set("", "<Leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true })
vim.keymap.set("", "<Leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("", "<Leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true })
vim.keymap.set("", "<Leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true })

-- vgit
vim.keymap.set("", "<Leader>gb", ":VGit toggle_live_blame<CR>", {})
vim.keymap.set("", "<Leader>gB", ":VGit buffer_gutter_blame_preview<CR>", {})
