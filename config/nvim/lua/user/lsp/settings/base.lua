local keymap = require("user.core.keymap")
local nmap = keymap.nmap
local M = {}

M.on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	nmap({
		{ "gc", vim.lsp.buf.declaration, bufopts },
		{ "gd", vim.lsp.buf.definition, bufopts },
		{ "gi", vim.lsp.buf.implementation, bufopts },
		{ "rn", vim.lsp.buf.rename, bufopts },
		{ "gt", vim.lsp.buf.type_definition, bufopts },
		{ "gr", vim.lsp.buf.references, bufopts },
	})
	require("lsp_signature").on_attach({
		bind = true,
	}, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

M.lsp_flags = {
	debounce_text_changes = 150,
}

return M
