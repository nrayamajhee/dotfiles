local set = vim.keymap.set
local nr = { noremap = true }
local si = { silent = true }
local nrsi = { unpack(nr), unpack(si) }

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

vim.opt.termguicolors = true
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
		yaml = {
			require("formatter.defaults.prettier"),
		},
		toml = {
			require("formatter.filetypes.toml").taplo,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
	},
})
set("", "<C-f>", ":FormatWrite<CR>", nr)

--comment

require("Comment").setup()
set("n", "<C-_>", ":lua require('Comment.api').toggle.linewise.current()<CR>", si)
set("x", "<C-_>", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", si)

--telescope

local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
local add_to_trouble = require("trouble.sources.telescope").add

local telescope = require("telescope")
telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		mappings = {
			i = { ["<c-t>"] = open_with_trouble },
			n = { ["<c-t>"] = open_with_trouble },
		},
	},
})

--trouble
require("trouble").setup()
set("n", "<leader>xx", "<cmd>Trouble toggle<cr>", nrsi)
set("n", "gr", "<cmd>Trouble lsp_references focus=true<cr>", nrsi)

-- require("telescope").load_extension("fzf")
set("", "<Leader>ff", "<cmd>Telescope find_files<CR>", nr)
set("", "<Leader>fg", "<cmd>Telescope live_grep<CR>", nr)
set("", "<Leader>fb", "<cmd>Telescope buffers<CR>", nr)
set("", "<Leader>fh", "<cmd>Telescope help_tags<CR>", nr)

--git
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>hs", gs.stage_hunk)
		map("n", "<leader>hr", gs.reset_hunk)
		map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("n", "<leader>hS", gs.stage_buffer)
		map("n", "<leader>hu", gs.undo_stage_hunk)
		map("n", "<leader>hR", gs.reset_buffer)
		map("n", "<leader>hp", gs.preview_hunk)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>hd", gs.diffthis)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

--treesitter
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.wgsl",
	callback = function()
		vim.bo.filetype = "wgsl"
	end,
})

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"rust",
		"nu",
		"typescript",
		"typescript",
		"tsx",
	},
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})

--nvim-ufo
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})
