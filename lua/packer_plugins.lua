return require("packer").startup(function(use)
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
	use({
		"famiu/nvim-reload",
		requires = "nvim-lua/plenary.nvim",
	})
	use("Shatur/neovim-ayu")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = "nvim-lua/plenary.nvim",
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
	use("neovim/nvim-lspconfig")
	use({
		"tanvirtin/vgit.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
end)
