local servers = require("config.languages").lsp()
local mason_install = require("config.languages").mason()

for name, config in pairs(servers) do
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
    },
    opts = {
      automatic_enable = false, 
      ensure_installed = mason_install
    },
  },
}
