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

require("telescope").setup()
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

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"rust",
		"typescript",
		"scala",
		"typescript",
    "tsx"
	},
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
	},
})

