require("nvim-tree").setup()
require("formatter").setup({
	filetype = {
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
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		scala = {
			function()
				vim.lsp.buf.format()
			end,
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
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "rust", "typescript", "scala" },
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
	},
})

-- nvim-lsp-utils
if vim.fn.has("nvim-0.5.1") == 1 then
	vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
	vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
	vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
	vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
	vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
	vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
	vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
	vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler
else
	local bufnr = vim.api.nvim_buf_get_number(0)

	vim.lsp.handlers["textDocument/codeAction"] = function(_, _, actions)
		require("lsputil.codeAction").code_action_handler(nil, actions, nil, nil, nil)
	end

	vim.lsp.handlers["textDocument/references"] = function(_, _, result)
		require("lsputil.locations").references_handler(nil, result, { bufnr = bufnr }, nil)
	end

	vim.lsp.handlers["textDocument/definition"] = function(_, method, result)
		require("lsputil.locations").definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
	end

	vim.lsp.handlers["textDocument/declaration"] = function(_, method, result)
		require("lsputil.locations").declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
	end

	vim.lsp.handlers["textDocument/typeDefinition"] = function(_, method, result)
		require("lsputil.locations").typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
	end

	vim.lsp.handlers["textDocument/implementation"] = function(_, method, result)
		require("lsputil.locations").implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
	end

	vim.lsp.handlers["textDocument/documentSymbol"] = function(_, _, result, _, bufn)
		require("lsputil.symbols").document_handler(nil, result, { bufnr = bufn }, nil)
	end

	vim.lsp.handlers["textDocument/symbol"] = function(_, _, result, _, bufn)
		require("lsputil.symbols").workspace_handler(nil, result, { bufnr = bufn }, nil)
	end
end
