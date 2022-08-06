local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("adal.lsp.lsp-installer")
require("adal.lsp.handlers").setup()
require "adal.lsp.null-ls"
