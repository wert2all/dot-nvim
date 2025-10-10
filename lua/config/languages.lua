-- LSPs - https://github.com/neovim/nvim-lspconfig/tree/master/lsp

vim.filetype.add({
  pattern = {
    [".*/defaults/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
    [".*/playbook.*%.ya?ml"] = "yaml.ansible",
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/molecule/.*%.ya?ml"] = "yaml.ansible",
  },
})

return {
  json = {
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
  },
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
