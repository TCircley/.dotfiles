return function()
	return {
		exe = "astyle",
		args = {
			"-n",
			"-s2",
			"--style=google",
		},
		stdin = true,
		try_node_modules = true,
	}
end
