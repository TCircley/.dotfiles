local ok, comment = pcall(require, "nvim_comment")
if not ok then
	error("comment not found!")
end

comment.setup({
	-- Linters prefer comment and line to have a space in between markers
	marker_padding = true,
	-- should comment out empty or whitespace only lines
	comment_empty = true,
	-- Should key mappings be created
	create_mappings = true,
	-- Normal mode mapping left hand side
	line_mapping = "cii",
	-- Visual/Operator mapping left hand side
	operator_mapping = "ci",
	-- Hook function to call before commenting takes place
	hook = function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "cpp" then -- cutomize difference language comment marker
			vim.api.nvim_buf_set_option(0, "commentstring", "//%s") -- cpp use //
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "c" then
			vim.api.nvim_buf_set_option(0, "commentstring", "/*%s*/") -- c use /* */
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "go" then
			vim.api.nvim_buf_set_option(0, "commentstring", "//%s") -- go use //
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "shell" then
			vim.api.nvim_buf_set_option(0, "commentstring", "#%s") -- shell use //
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "javascript" then
			vim.api.nvim_buf_set_option(0, "commentstring", "//%s") -- javascript use //
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "css" then
			vim.api.nvim_buf_set_option(0, "commentstring", "/*%s*/") -- css use /* */
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "sass" then
			vim.api.nvim_buf_set_option(0, "commentstring", "/*%s*/") -- sass use /* */
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "scss" then
			vim.api.nvim_buf_set_option(0, "commentstring", "/*%s*/") -- scss use /* */
		end
	end,
})
