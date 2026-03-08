return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "basedpyright", "cssls", "html", "emmet_ls", "tsserver" }, -- "tsserver" is the correct name, not "ts_ls"
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "ruff",
          "eslint",
          "prettier",
          "stylelint",
        },
        auto_update = true,
        run_on_start = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP server configs (new API)
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("tsserver", {
        capabilities = capabilities,
      })

      vim.lsp.config("cssls", {
        capabilities = capabilities,
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
      })

      vim.lsp.config("emmet_ls", {
        capabilities = capabilities,
      })

      -- Diagnostics filter (ignore basedpyright)
      local orig_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        if result.diagnostics then
          local filtered = {}
          for _, d in ipairs(result.diagnostics) do
            if d.source ~= "basedpyright" then
              table.insert(filtered, d)
            end
          end
          result.diagnostics = filtered
        end
        orig_handler(err, result, ctx, config)
      end

      -- Enable the servers
      for _, srv in ipairs({ "lua_ls", "tsserver", "cssls", "html", "emmet_ls" }) do
        vim.lsp.enable(srv)
      end

      -- Keymaps
      vim.keymap.set("n", "gn", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>vz", vim.lsp.buf.code_action, {})

      -- Diagnostic config
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 4,
          severity = { min = vim.diagnostic.severity.WARN },
          format = function(d)
            local msg = vim.split(d.message, "\n", { plain = true })[1]
            local max = 70
            if #msg > max then
              return msg:sub(1, max - 3) .. "..."
            end
            return msg
          end,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
        },
      })
    end,
  },
}
