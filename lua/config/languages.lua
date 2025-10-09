-- LSPs - https://github.com/neovim/nvim-lspconfig/tree/master/lsp

return {
  installed = {
    lua             = require("config.languages.lua"),
    bash            = require("config.languages.bash"),
    markdown        = require("config.languages.markdown"),
    markdown_inline = {},
    yaml            = require("config.languages.yaml"),
  }
}
