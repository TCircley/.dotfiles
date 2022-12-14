local ok, lualine = pcall(require, "lualine")
if not ok then
	error("lualine not found.")
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = "#98be65" },
		modified = { fg = "#ecbe7b" },
		removed = { fg = "#ec5f67" },
	},
	cond = hide_in_width,
	source = diff_source,
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local file_name = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	path = 1, -- 0: Just the filename
	-- 1: Relative path
	-- 2: Absolute path

	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
	-- for other components. (terrible name, any suggestions?)
	symbols = {
		modified = "[+]", -- Text to show when the file is modified.
		readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
	},
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = { file_name },
		lualine_x = { diff, spaces, "encoding", filetype, "fileformat" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { file_name },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree" },
})
