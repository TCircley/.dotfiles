local keymap = require("user.core.keymap")
local cmd, nmap = keymap.cmd, keymap.nmap

nmap({
	-- editor
	{ ";", ":", { silent = false } },
	{ "s", "" },
	{ "<C-j>", "5j" },
	{ "<C-k>", "5k" },
	{ "bn", cmd("bprevious") },
	{ "bp", cmd("bnext") },
	{ "<leader><CR>", cmd("nohlsearch") },
	-- window
	{ "sl", cmd("vsplit") },
	{ "sj", cmd("split") },
	{ "sv", "<C-w>t<C-w>H" },
	{ "sh", "<C-w>t<C-w>K" },
	{ "<up>", cmd("resize -2") },
	{ "<down>", cmd("resize +2") },
	{ "<left>", cmd("vertical resize -2") },
	{ "<right>", cmd("vertical resize +2") },
	-- nvim-tree
	{ "<leader>e", cmd("NvimTreeToggle") },
	-- telescope
	{ "<leader>p", cmd("Telescope find_files") },
	{ "<leader>s", cmd("Telescope aerial") },
	{ "<leader>r", cmd("Telescope asynctasks all") },
	{ "<leader>b", cmd("Telescope buffers") },
	-- diagnostic
	{ "gp", cmd("lua vim.diagnostic.open_float()") },
	{ "gk", cmd("lua vim.diagnostic.goto_prev()") },
	{ "gj", cmd("lua vim.diagnostic.goto_next()") },
	-- dap
	{ "<leader>5", cmd("DapContinue") },
	{ "<leader>6", cmd("DapStepInto") },
	{ "<leader>7", cmd("DapStepOut") },
	{ "<leader>8", cmd("DapStepOver") },
	{ "<leader>9", cmd("DapToggleBreakpoint") },
	{ "<leader>0", cmd("DapTerminate") },
})
