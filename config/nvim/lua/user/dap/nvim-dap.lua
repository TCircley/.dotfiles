local dap_breakpoint = {
	error = {
		text = "",
		texthl = "Error",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "",
		texthl = "LspDiagnosticsSignInformation",
		linehl = "",
		numhl = "",
	},
}
vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)

require("user.dap.settings.dap-codelldb")
require("user.dap.settings.dap-chrome")
