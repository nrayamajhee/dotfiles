local set = vim.keymap.set
local nr = { noremap = true }
local si = { silent = true }
local nrsi = { unpack(nr), unpack(si) }

set("", "<C-\\>", ":NvimTreeFindFileToggle<CR>", si)
set("", "<C-s>", ":Reload<CR>", nr)
set("", "<C-f>", ":FormatWrite<CR>", nr)
set("n", "<Leader>w", "<C-w>", nr)
set("", "<C-w>", ":bd<CR>", nrsi)
set("", "<C-n>", ":bn<CR>", nrsi)
set("", "<C-l>", ":b#<CR>", nrsi)
set("", "<C-h>", ":nohlsearch<CR>", nrsi)
set("", "<C-o>", ":echo expand('%:p')<CR>", nrsi)
set("", "<C-p>", ":bp<CR>", nrsi)
set("", "L", "J", nr)
set("", "J", "<C-d>", nr)
set("", "K", "<C-u>", nr)
set("", "<C-k>", "<C-y>", nr)
set("", "<C-j>", "<C-e>", nr)
set("", "<C-e>", "$", nr)
set("", "<C-a>", "0", nr)

-- telescope
set("", "<Leader>ff", "<cmd>Telescope find_files<CR>", nr)
set("", "<Leader>fg", "<cmd>Telescope live_grep<CR>", nr)
set("", "<Leader>fb", "<cmd>Telescope buffers<CR>", nr)
set("", "<Leader>fh", "<cmd>Telescope help_tags<CR>", nr)

-- vgit
set("", "<Leader>gb", ":VGit toggle_live_blame<CR>", {})
set("", "<Leader>gB", ":VGit buffer_gutter_blame_preview<CR>", {})

-- comment
set("n", "<C-_>", ":lua require('Comment.api').toggle_current_linewise()<CR>", opts)
set("x", "<C-_>", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", nrsi)

-- harpoon
set("", "<Leader>hm", ":lua require('harpoon.mark').add_file()<CR>", {})
set("", "<Leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", si)
