return require("packer").startup(function(use)
	use("nvim-lua/plenary.nvim")
	use("wbthomason/packer.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ "mhartington/formatter.nvim" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("famiu/nvim-reload")
	use("Shatur/neovim-ayu")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("numToStr/Comment.nvim")
	use("tanvirtin/vgit.nvim")
	use("xiyaowong/nvim-transparent")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("RishabhRD/popfix")
	use("RishabhRD/nvim-lsputils")
	use("scalameta/nvim-metals")
	use("nvim-treesitter/nvim-treesitter")
end)
