return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      -- Set highlight groups with explicit colors (adjust colors to your taste/theme)
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#a6e3a1" })       -- greenish
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#f9e2af" })    -- yellowish
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#f38ba8" })    -- reddish
      vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = "#f38ba8" })
      vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#f9e2af" })

      require("gitsigns").setup {
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "│" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        current_line_blame = false,
        signcolumn = true,
      }
    end,
  },
}
