local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	error("nvim-treesitter not found.")
end

treesitter.setup({
	ensure_installed = {
		"json",
		"html",
		"css",
		"scss",
		"lua",
		"c",
		"cpp",
		"cmake",
		"bash",
		"tsx",
		"typescript",
		"javascript",
		"vue",
		"vim",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = { "tsx", "typescript", "javascript" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	indent = {
		enable = true,
		disable = { "tsx", "javascript", "typescript" },
	},
})
