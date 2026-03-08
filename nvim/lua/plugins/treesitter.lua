return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = { "lua", "javascript", "python", "html", "css" },
        highlight = { enable = true },
        indent = { enable = true },
      })
      vim.keymap.set("n", "<leader>n", ':Neotree filesystem reveal left<CR>')
    end,
  },
}

