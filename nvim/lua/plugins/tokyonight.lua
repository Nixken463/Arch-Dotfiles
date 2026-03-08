-- nvim/lua/plugins/tokyonight.lua
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
        style = "night"
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd("colorscheme tokyonight")
			-- after you set up tokyonight …
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "NONE", link = "DiagnosticError" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "NONE", link = "DiagnosticWarn" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "NONE", link = "DiagnosticInfo" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "NONE", link = "DiagnosticHint" })
		end,
	},
}
