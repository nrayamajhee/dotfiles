local set = vim.keymap.set
local nr = { noremap = true }
local si = { silent = true }
local nrsi = { unpack(nr), unpack(si) }

--lsp

require("mason").setup()
local servers = { "tsserver", "rust_analyzer" }
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in pairs(servers) do
	require("lspconfig")[lsp].setup({})
end

vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float)
-- let trouble hande it
-- vim.keymap.set("n", "<leader>dw", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		local opts = { buffer = ev.buf }
		--vital
		vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>cc", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>ss", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>hh", vim.lsp.buf.hover, opts)
		-- let trouble hande it
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		--notusedoften
		vim.keymap.set("n", "<space>D", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		--vastigial
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		-- let formatter hande it
		-- vim.keymap.set("n", "<space>f", function()
		-- 	vim.lsp.buf.format({ async = true })
		-- end, opts)
	end,
})

--cmp

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")

local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

require("copilot").setup({
	suggestion = { auto_trigger = true, keymap = {
		accept = "<Tab>",
	} },
	panel = { enabled = false },
})

require("copilot_cmp").setup()

for _, lsp in pairs(servers) do
	require("lspconfig")[lsp].setup({
		capabilities = capabilities,
	})
end

--trouble

require("trouble").setup()
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleClose<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>dw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>dd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>qf", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gd", "<cmd>TroubleToggle lsp_definitions<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gD", "<cmd>TroubleToggle lsp_type_definitions<cr>", { silent = true, noremap = true })

--metals
local metals_config = require("metals").bare_config()
metals_config.capabilities = capabilities
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt" },
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})
