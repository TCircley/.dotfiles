local ok, packer = pcall(require, "packer")
if not ok then
	error("packer not found.")
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function(use)
	-- packer itself
	use("wbthomason/packer.nvim")
	-- theme
	use("folke/tokyonight.nvim")
	-- nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})
	-- lualine
	use("nvim-lualine/lualine.nvim")
	-- bufferline
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
	})
	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use("williamboman/mason.nvim")
	-- lsp
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("ray-x/lsp_signature.nvim")
	use("jose-elias-alvarez/typescript.nvim")
	use("hrsh7th/vim-vsnip")
	-- aerial
	use("stevearc/aerial.nvim")
	-- formatter
	use("mhartington/formatter.nvim")
	-- nvim-treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- asynctasks
	use({
		"skywind3000/asynctasks.vim",
		requires = { "skywind3000/asyncrun.vim" },
	})
	use({
		"GustavoKatel/telescope-asynctasks.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
	})
	-- auto-pairs
	use("windwp/nvim-autopairs")
	-- dap
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	-- comment
	use("terrortylor/nvim-comment")
end)
