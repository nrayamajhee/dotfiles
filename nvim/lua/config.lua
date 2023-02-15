vim.opt.number = true
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.mouse = "a"
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.textwidth = 100
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.textwidth=100
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"

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
-- loaded_netrwPlugin  = false
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'netrw',
--   command = "setl bufhidden=wipe"
-- })
