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
}
