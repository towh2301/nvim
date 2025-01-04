return {
	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		build = ":ToggleTerm",
		keys = { { "<c-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" } },
		opts = {
			size = 16,
			open_mapping = [[<c-t>]],
			hide_number = true,
			shade_filetypes = {},
			shahe_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		},
	},
}
