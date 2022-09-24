local colorscheme = "tokyonight"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
	error("colorscheme " .. colorscheme .. " not found")
end

require("tokyonight").setup({
	style = "night",
})
