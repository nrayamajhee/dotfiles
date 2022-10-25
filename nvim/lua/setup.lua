require("nvim-tree").setup()
require("formatter").setup({
	filetype = {
		html = {
			require("formatter.defaults.prettier"),
		},
		css = {
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
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
	},
})
require("ayu").colorscheme()
require("lualine").setup({
	options = {
		theme = "ayu_dark",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
})
require("nvim-reload")
require("bufferline").setup({
	options = {
		right_mouse_command = nil,
		middle_mouse_command = "bd %d",
		indicator = {
			icon = "▐ ",
			style = "icon",
		},
	},
})
require("Comment").setup({
	mappings = {
		basic = false,
	},
})
require("vgit").setup()
vim.o.updatetime = 300
vim.wo.signcolumn = "yes"
require("transparent").setup({
	enable = true,
	extra_groups = {
		"BufferLineTabClose",
		"BufferlineBufferSelected",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",
	},
	exclude = {},
})
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "rust", "typescript", "scala" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
  },
}
