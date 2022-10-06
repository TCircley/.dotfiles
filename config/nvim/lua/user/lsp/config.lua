local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	error("lspconfig not found.")
end

lspconfig.sumneko_lua.setup(require("user.lsp.settings.sumneko"))
lspconfig.emmet_ls.setup(require("user.lsp.settings.base"))
lspconfig.clangd.setup(require("user.lsp.settings.base"))
lspconfig.eslint.setup(require("user.lsp.settings.base"))
require("typescript").setup({
	server = require("user.lsp.settings.base"),
})
