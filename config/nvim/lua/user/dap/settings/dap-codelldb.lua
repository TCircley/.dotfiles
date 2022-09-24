local dap = require("dap")

local cmd = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"
local port = 13000

dap.adapters.codelldb = {
	type = "server",
	port = port,
	executable = {
		-- command = os.getenv("CODELLDB_PATH"),
		command = cmd,
		args = {
			"--port",
			port,
		},
	},
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		console = "internalConsole",
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
