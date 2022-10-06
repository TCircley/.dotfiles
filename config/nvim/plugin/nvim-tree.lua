local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
	error("nvim-tree not found.")
end

nvimtree.setup({
	disable_netrw = true,
	-- open_on_setup_file = true,
	-- open_on_setup = true,
	reload_on_bufenter = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	actions = {
		change_dir = {
			enable = false,
		},
	},
	git = {
		enable = true,
		show_on_dirs = true,
		ignore = false,
	},
	view = {
		width = 30,
		adaptive_size = false,
		hide_root_folder = true,
		preserve_window_proportions = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "<CR>", "l" }, action = "edit", mode = "n" },
				{ key = { "o" }, action = "system_open", mode = "n" },
				{ key = { "s" }, action = "", mode = "n" },
			},
		},
	},
	filters = {
		dotfiles = false,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			webdev_colors = true,
			glyphs = {
				git = {
					unstaged = "",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "",
					ignored = "",
				},
			},
		},
	},
})

vim.cmd([[highlight NvimTreeGitDirty guifg=#ECDB7b ]])
vim.cmd([[highlight NvimTreeGitNew guifg=#98BE65]])
vim.cmd([[highlight NvimTreeGitDeleted guifg=#F25B52]])

require("nvim-tree.events").on_file_created(function(file)
	vim.cmd("edit " .. file.fname)
end)
