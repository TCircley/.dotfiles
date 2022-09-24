local ok, aerial = pcall(require, "aerial")
if not ok then
	error("aerial not found.")
end

aerial.setup({
	backends = { "lsp", "treesitter" },
})
