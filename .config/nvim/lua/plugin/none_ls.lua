return{

"nvimtools/none-ls.nvim",
	
	config=function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
				--require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
				--go install -v github.com/incu6us/goimports-reviser/v3@latest
				-- go install mvdan.cc/gofumpt@latest
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
				--go install github.com/segmentio/golines@latest
				null_ls.builtins.formatting.golines,
			},
		})	
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({
					group = augroup,
					buffer = bufnr,
				})
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end 
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format,{})

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,{})
	end,
}
