local formatter = require("formatter")

formatter.setup({
	filetype = {
		lua = {
			function()
				return {
					exe = "stylua",
				}
			end,
		},
		c = require("user.formatter.settings.astyle"),
		cpp = require("user.formatter.settings.astyle"),
		["*"] = require("user.formatter.settings.prettier"),
	},
})

vim.api.nvim_exec(
	[[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
    augroup END
  ]],
	true
)
