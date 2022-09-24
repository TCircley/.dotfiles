local ok, mason = pcall(require, "mason")
if not ok then
	error("mason not found.")
end

mason.setup()
