local base = require("user.lsp.settings.base")

local opts = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

return vim.tbl_deep_extend("force", base, opts)
