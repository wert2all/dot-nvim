-- LSPs - https://github.com/neovim/nvim-lspconfig/tree/master/lsp

return {
  bash     = require("config.languages.bash"),
  html     = require("config.languages.html"),
  json     = require("config.languages.json"),
  lua      = require("config.languages.lua"),
  markdown = require("config.languages.markdown"),
  yaml     = require("config.languages.yaml"),
}
