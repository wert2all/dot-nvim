return {
  ft = "markdown",
  mason = { "marksman", "prettier" },
  lsp = {
    marksman = {
      cmd = { 'marksman', 'server' },
      filetypes = { 'markdown', 'markdown.mdx' },
      root_markers = { '.marksman.toml', '.git' },
    }
  },
  formatters = { "prettier" },
}
