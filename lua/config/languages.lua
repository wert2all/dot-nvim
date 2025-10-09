-- LSPs - https://github.com/neovim/nvim-lspconfig/tree/master/lsp

return {
  lua       = {
    filetypes = {
      lua = {
        lsp = "lua_ls",
        formatters = { "stylua" },
        linters = { "luacheck" },
      }
    },
    treesitter = { "lua" },
    mason = { "lua-language-server", "stylua", "luacheck" },
  },
  bash      = {
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
  },
  yaml      = {
    filetypes = {
      yaml = {
        lsp = "yamlls",
        formatters = { "prettier" },
        linters = { "yamllint" },
      }
    },
    treesitter = { "yaml" },
    mason = { "yaml-language-server", "ansible-lint", "ansible-language-server" },
  },
  markdown  = {
    filetypes = {
      markdown = {
        lsp = "marksman",
        formatters = { "prettier" },
      },
    },
    treesitter = { "markdown", "markdown_inline" },
    mason = { "marksman", "prettier" },
  },

  installed = {
    lua             = require("config.languages.lua"),
    bash            = require("config.languages.bash"),
    markdown        = require("config.languages.markdown"),
    markdown_inline = {},
    yaml            = require("config.languages.yaml"),
  }
}
