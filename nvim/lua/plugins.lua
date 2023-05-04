local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	"wbthomason/packer.nvim",
	"famiu/nvim-reload",
	"Shatur/neovim-ayu",
	"xiyaowong/nvim-transparent",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"mhartington/formatter.nvim",
	"numToStr/Comment.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	"lewis6991/gitsigns.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = { "nvim-tree/nvim-web-devicons" } },
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	{
		"L3MON4D3/LuaSnip",
		version = "1.2.2",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"rafamadriz/friendly-snippets",
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	{ "scalameta/nvim-metals", dependencies = { "nvim-lua/plenary.nvim" } },
})
