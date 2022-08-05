local set = vim.keymap.set
local opts = { noremap = true, silent = true }

set("", "<C-\\>", ":NvimTreeFindFileToggle<CR>", { silent = true })
set("", "<C-s>", ":Reload<CR>", { noremap = true })
set("", "<C-f>", ":FormatWrite<CR>", { noremap = true })
set("n", "<Leader>w", "<C-w>", { noremap = true })
set("", "<C-w>", ":bd<CR>", { noremap = true, silent = true })
set("", "<C-n>", ":bn<CR>", { noremap = true, silent = true })
set("", "<C-h>", ":nohlsearch<CR>", { noremap = true, silent = true })
set("", "<C-p>", ":bp<CR>", { noremap = true, silent = true })
set("", "L", "J", { noremap = true })
set("", "J", "<C-d>", { noremap = true })
set("", "K", "<C-u>", { noremap = true })
set("", "<C-k>", "<C-y>", { noremap = true })
set("", "<C-j>", "<C-e>", { noremap = true })
set("", "<C-e>", "$", { noremap = true })
set("", "<C-a>", "0", { noremap = true })

-- telescope
set("", "<Leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true })
set("", "<Leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true })
set("", "<Leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true })
set("", "<Leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true })

-- vgit
set("", "<Leader>gb", ":VGit toggle_live_blame<CR>", {})
set("", "<Leader>gB", ":VGit buffer_gutter_blame_preview<CR>", {})

-- comment
set("n", "<C-_>", ":lua require('Comment.api').toggle_current_linewise()<CR>", opts)
set("x", "<C-_>", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)
