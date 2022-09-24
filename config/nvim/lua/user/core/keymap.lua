local keymap = {}

function keymap.cmd(command)
	return "<cmd>" .. command .. "<CR>"
end

local function set_keymap(mode, tb1)
	vim.validate({
		tb1 = { tb1, "table" },
	})

	local len = #tb1
	if len < 2 then
		vim.notify("keymap must has rhs.")
		return
	end

	local options = { noremap = true, silent = true }
	if len == 3 and type(tb1[3]) == "table" then
		options = vim.tbl_deep_extend("force", options, tb1[3])
	end
	vim.keymap.set(mode, tb1[1], tb1[2], options)
end

local function map(mode)
	return function(tb1)
		vim.validate({
			tb1 = { tb1, "table" },
		})
		if type(tb1[1]) == "table" and type(tb1[2]) == "table" then
			for _, v in pairs(tb1) do
				set_keymap(mode, v)
			end
		else
			set_keymap(mode, tb1)
		end
	end
end

keymap.nmap = map("n")
keymap.imap = map("i")
keymap.tmap = map("t")
keymap.cmap = map("c")
keymap.vmap = map("v")

return keymap
