-- LSPs - https://github.com/neovim/nvim-lspconfig/tree/master/lsp

return {
  lua = {
    filetypes = {
      lua = {
        lsp = "lua_ls",
      },
    },
    treesitter = { "lua" },
    mason = { "lua-language-server" },
  },
  bash = {
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
  yaml = {
    filetypes = {
      yaml = {
        lsp = "yamlls",
        formatters = { "prettier" },
        linters = { "yamllint" },
      },
      ["yaml.ansible"] = {
        lsp = "ansiblels",
        formatters = { "prettier" },
        linters = { "ansible-lint" },
      },
    },
    treesitter = { "yaml" },
    mason = { "yaml-language-server", "ansible-lint", "ansible-language-server" },
  },
  markdown = {
    filetypes = {
      markdown = {
        lsp = "marksman",
        formatters = { "prettier" },
      },
    },
    treesitter = { "markdown", "markdown_inline" },
    mason = { "marksman", "prettier" },
  },
}
