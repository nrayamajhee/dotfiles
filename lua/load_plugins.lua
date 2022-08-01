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
		right_mouse_command = "",
		middle_mouse_command = "bdelete! %d",
		show_close_icon = false,
	},
})
require("Comment").setup({
	opleader = {
		line = "<C-_>",
	},
})
require("vgit").setup()
