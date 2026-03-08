-- lua/plugins/autopairs.lua
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Load plugin when you enter insert mode
    config = function()
      require("nvim-autopairs").setup({
        -- You can add custom configuration here if needed
        -- For example, to disable in specific filetypes:
        -- disable_filetype = { "TelescopePrompt" , "vim" },
      })
    end,
  },
}
