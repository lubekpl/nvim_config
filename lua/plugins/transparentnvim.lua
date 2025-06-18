return {
	"tribela/transparent.nvim",
	lazy = false,
	config = function()
		require("transparent").setup({
			auto = true,
			extra_groups = {
				"NormalFloat",
				"TablineFill",
				"CursorLine",
			},
			excludes = {},
		})
	end,
}
