return {
  filetypes = {
    sh = {
      lsp = "bashls",
      formatters = { "shfmt" },
    },
    bash = {
      lsp = "bashls",
      formatters = { "shfmt" },
    },
  },
  treesitter = { "bash" },
  mason = { "bash-language-server", "shfmt" },
}
