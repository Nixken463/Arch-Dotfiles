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



-- nvim/lua/plugins/catppuccin.lua
--[[return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}]]
