-- nvim/lua/plugins/alpha-nvim.lua
return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha     = require("alpha")
    local dashboard = require("alpha.themes.startify")

    -- 1) Define and apply your custom highlight
    local function set_header_highlight()
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#b154e2" })
    end
    set_header_highlight()

    -- 2) Re-apply on any colorscheme change (theme-proof)
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_header_highlight,
    })

    -- 3) Tell the dashboard to use your group via opts.hl
    dashboard.section.header.opts.hl = "AlphaHeader"

    -- 4) Your ASCII art header
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    -- 5) Setup Alpha and disable folding
    alpha.setup(dashboard.opts)
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
