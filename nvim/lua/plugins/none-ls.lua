return {

	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({

			sources = {

				null_ls.builtins.formatting.stylua,

				null_ls.builtins.formatting.ruff,

				null_ls.builtins.diagnostics.ruff,

				null_ls.builtins.diagnostics.eslint,

				null_ls.builtins.formatting.prettier,

				null_ls.builtins.diagnostics.stylelint,

				null_ls.builtins.formatting.stylelint,
			},
		})

		vim.keymap.set("n", "<leader>ne", vim.lsp.buf.format, {})
	end,
}
