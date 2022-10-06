local dap = require("dap")

local cmd = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"

dap.adapters.cpptools = {
	id = "cppdbg",
	type = "executable",
	command = cmd,
	-- options = {
	-- 	detached = false,
	-- },
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cpptools",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		MIMode = "lldb",
		cwd = "${workspaceFolder}",
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
