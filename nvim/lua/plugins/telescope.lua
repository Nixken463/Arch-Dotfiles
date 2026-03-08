return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup{}

      vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fp", require("telescope.builtin").live_grep, { desc = "Live grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()

      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  }
}

