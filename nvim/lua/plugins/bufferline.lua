return {
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					themable = true,
					separator_style = "thin",
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = false,
					indicator = {
						style = "underline",
					},
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							text_align = "left",
							separator = true,
						},
					},
					always_show_bufferline = false,
				},
			})
			vim.keymap.set("n", "<Tab>", function()
				vim.cmd.bnext()
			end, { desc = "Next buffer", silent = true })
			vim.keymap.set("n", "<S-Tab>", function()
				vim.cmd.bprevious()
			end, { desc = "Previous buffer", silent = true })
			vim.keymap.set("n", "<leader>x", function()
				vim.cmd.bdelete()
			end, { desc = "Close current buffer", silent = true })
		end,
	},
}
