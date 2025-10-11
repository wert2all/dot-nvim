return {
  filetypes = {
    markdown = {
      lsp = "marksman",
      formatters = { "prettier" },
    },
  },
  treesitter = { "markdown", "markdown_inline" },
  mason = { "marksman", "prettier" },
}
