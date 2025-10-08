local servers = require("config.languages").lsp_servers()

for name, config in pairs(servers) do
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

vim.diagnostic.config({
    virtual_lines = true,
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local mappings = require("config.mappings")
    mappings.set_mappings(mappings.keys.lsp, { buffer = args.buf})

    -- map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
    -- map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
    --
    -- map({ "n", "x" }, "gra", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
    -- map({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
    --
    -- map("n", "grn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
    -- map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
    --
    -- map("n", "grr", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })
    -- map("n", "<leader>lR", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })
    --
    -- map("n", "gri", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementation" })
    -- map("n", "gy", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Definition of current type" })
    --
    -- map({ "i", "s" }, "<C-S>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })
  end,
})

return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts={} },
    },
    opts = {
      automatic_enable = false, 
      ensure_installed = require("config.languages").mason() 
    },
  },
}
