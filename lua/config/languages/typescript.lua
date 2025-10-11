return {
  filetypes = {
    javascript = {
      lsp = "vtsls",
      formatters = { "prettier" },
    },
    typescript = {
      lsp = "vtsls",
      formatters = { "prettier" },
    },
  },
  mason = { "vtsls", "prettier" },
  treesitter = { "javascript", "typescript", "jsdoc" },
}
