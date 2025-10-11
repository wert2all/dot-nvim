vim.filetype.add({
  extension = {
    pcss = "postcss",
    postcss = "postcss",
  }
})
vim.treesitter.language.register("scss", "less")
vim.treesitter.language.register("scss", "postcss")

return {
  filetypes = {
    html = {
      lsp = "html",
      formatters = { "prettier" },
    },
    css = {
      lsp = "cssls",
      formatters = { "prettier" },
    },
    less = {
      lsp = "cssls",
      formatters = { "prettier" },
    },
    sass = {
      lsp = "emmet_ls",
      formatters = { "prettier" },
    },
    scss = {
      lsp = "cssls",
      formatters = { "prettier" },
    },
  },
  mason = { "html-lsp", "css-lsp", "emmet-ls" },
  treesitter = { "html", "css", "scss", "styled" }
}
