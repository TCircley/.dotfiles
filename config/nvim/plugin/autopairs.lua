local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
	error("nvim-autopairs not found.")
end

local Rule = require("nvim-autopairs.rule")

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string" },
		javascript = { "templatee_string" },
	},
})

local ts_conds = require("nvim-autopairs.ts-conds")

npairs.add_rules({
	Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
	Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
})
