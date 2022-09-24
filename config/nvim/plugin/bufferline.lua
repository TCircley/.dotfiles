local ok, bufferline = pcall(require, "bufferline")
if not ok then
	error("bufferline not found.")
end

bufferline.setup({
	options = {
		mode = "buffers",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		diagnostics = "nvim_lsp", -- 'nvim_lsp' or 'coc'
		diagnostics_update_in_insert = false,
		indicator = {
			icon = "▎",
			style = "icon",
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				text_align = "center",
			},
		},
	},
})
