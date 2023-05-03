local set = vim.keymap.set
local nr = { noremap = true }
local si = { silent = true }
local nrsi = { unpack(nr), unpack(si) }

--nvim-reload

require("nvim-reload")
set("", "<C-s>", ":Reload<CR>", nr)

--theme

local ayu = require("ayu")
ayu.setup({
	mirage = false,
})
ayu.colorscheme()

--transparent

require("transparent").setup()

--status-line

require("lualine").setup({
	options = {
		theme = "ayu_dark",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
})

--buffer-line

vim.opt.mouse = "a"
vim.opt.mousemev = true
require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		right_mouse_command = "BufferLineTogglePin",
		middle_mouse_command = "bd %d",
		indicator = {
			icon = "",
		},
		hover = {
			enabled = true,
			delay = 10,
			reveal = { "close" },
		},
	},
})

--nvim-tree

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup({
	filters = {
		dotfiles = false,
	},
})
set("", "<C-\\>", ":NvimTreeFindFileToggle<CR>", si)

--formatter

local util = require("formatter.util")
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		html = {
			require("formatter.defaults.prettier"),
		},
		css = {
			require("formatter.defaults.prettier"),
		},
		json = {
			require("formatter.defaults.prettier"),
		},
		javascript = {
			require("formatter.defaults.prettier"),
		},
		javascriptreact = {
			require("formatter.defaults.prettier"),
		},
		typescript = {
			require("formatter.defaults.prettier"),
		},
		typescriptreact = {
			require("formatter.defaults.prettier"),
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		scala = {
			function()
				vim.lsp.buf.format()
			end,
		},
	},
})
set("", "<C-f>", ":FormatWrite<CR>", nr)

--comment

require("Comment").setup()
set("n", "<C-_>", ":lua require('Comment.api').toggle.linewise.current()<CR>", si)
set("x", "<C-_>", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", si)

--telescope

require("telescope").load_extension("fzf")
set("", "<Leader>ff", "<cmd>Telescope find_files<CR>", nr)
set("", "<Leader>fg", "<cmd>Telescope live_grep<CR>", nr)
set("", "<Leader>fb", "<cmd>Telescope buffers<CR>", nr)
set("", "<Leader>fh", "<cmd>Telescope help_tags<CR>", nr)

--git
require("vgit").setup()
vim.o.updatetime = 200
vim.o.incsearch = false
vim.wo.signcolumn = "yes"
set("", "<Leader>gb", ":VGit toggle_live_blame<CR>", {})
set("", "<Leader>gB", ":VGit buffer_gutter_blame_preview<CR>", {})

--treesitter

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "typescript", "scala" },
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
	},
})
