return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			char = {
				enabled = true,
				keys = { "f", "F", "t", "T", ";", "," }, -- exclude s/S to preserve native behavior
			},
			search = {
				enabled = false,
			},
		},
		search = {
			multi_window = true,
			forward = true,
			wrap = true,
			incremental = false,
		},
		jump = {
			jumplist = true,
			pos = "start",
			history = false,
			register = false,
			nohlsearch = false,
			autojump = false,
		},
		label = {
			uppercase = true,
			exclude = "",
			current = true,
			after = true,
			before = false,
			style = "overlay",
			reuse = "lowercase",
			distance = true,
			min_pattern_length = 0,
			rainbow = {
				enabled = false,
				shade = 5,
			},
		},
		highlight = {
			backdrop = true,
			matches = true,
			priority = 5000,
			groups = {
				match = "FlashMatch",
				current = "FlashCurrent",
				backdrop = "FlashBackdrop",
				label = "FlashLabel",
			},
		},
		action = nil,
		pattern = "",
		continue = false,
		config = nil,
		prompt = {
			enabled = true,
			prefix = { { "⚡", "FlashPromptIcon" } },
			win_config = {
				relative = "editor",
				width = 1,
				height = 1,
				row = -1,
				col = 0,
				zindex = 1000,
			},
		},
		remote_op = {
			restore = false,
			motion = false,
		},
	},
	keys = {
		{
			"<leader>f",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
}

