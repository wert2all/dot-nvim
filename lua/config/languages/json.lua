return {
  filetypes = {
    json = {
      lsp = "jsonls",
      formatters = { "prettier" },
    },
    jsonc = {
      lsp = "jsonls",
      formatters = { "prettier" },
    },
  },
  treesitter = { "json", "jsonc" },
  mason = { "json-lsp", "prettier" },
}
