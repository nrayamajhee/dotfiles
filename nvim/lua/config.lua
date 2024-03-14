--general

vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.mouse = "a"
vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.textwidth = 100
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"

--code-folding
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

--line-number

vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_augroup("numtoggle", {})
vim.api.nvim_create_autocmd({ "FocusGained", "InsertLeave" }, {
	group = "numtoggle",
	pattern = "*",
	command = "set relativenumber",
})
vim.api.nvim_create_autocmd({ "FocusLost", "InsertEnter" }, {
	group = "numtoggle",
	pattern = "*",
	command = "set norelativenumber",
})
vim.g.transparent_enabled = true

--keymap

local set = vim.keymap.set
local nr = { noremap = true }
local si = { silent = true }
local nrsi = { unpack(nr), unpack(si) }

set("", "<C-o>", ":echo expand('%:p')<CR>", nrsi)
set("", "<C-h>", ":nohlsearch<CR>", nrsi)
set("", "<C-w>", ":bd<CR>", nrsi)
set("n", "<Leader>w", "<C-w>", nr)
set("", "<C-n>", ":bn<CR>", nrsi)
set("", "<C-p>", ":bp<CR>", nrsi)
set("", "L", "J", nr)
set("", "J", "<C-d>", nr)
set("", "K", "<C-u>", nr)
set("", "<C-k>", "<C-y>", nr)
set("", "<C-j>", "<C-e>", nr)
set("", "<C-e>", "$", nr)
set("", "<C-a>", "0", nr)
set("x", "<Leader>p", '"_dP', nr)
