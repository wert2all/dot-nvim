-- LSPs - https://github.com/neovim/nvim-lspconfig/tree/master/lsp

local L = {
  installed = {
    lua             = require("config.languages.lua"),
    bash            = require("config.languages.bash"),
    markdown        = require("config.languages.markdown"),
    markdown_inline = {},
    yaml            = {
      ft = "yaml",
      lsp = {
        yamlls = {
          cmd = { 'yaml-language-server', '--stdio' },
          filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },
          root_markers = { '.git' },
          settings = {
            -- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
            redhat = { telemetry = { enabled = false } },
            -- formatting disabled by default in yaml-language-server; enable it
            yaml = { format = { enable = true } },
          },
          on_init = function(client)
            --- https://github.com/neovim/nvim-lspconfig/pull/4016
            --- Since formatting is disabled by default if you check `client:supports_method('textDocument/formatting')`
            --- during `LspAttach` it will return `false`. This hack sets the capability to `true` to facilitate
            --- autocmd's which check this capability
            client.server_capabilities.documentFormattingProvider = true
          end,
        }
      },
      mason = { "yaml-language-server" },
      formatters = { "prettier" },
    },
  }
}

function L.treesitter()
  local l = {}
  for lang, _ in pairs(L.installed) do
    table.insert(l, lang)
  end
  return l
end

function L.formatters()
  local f = {}

  for _, opts in pairs(L.installed) do
    if opts.ft and opts.formatters then
      local ftf = {}

      for _, formatter in pairs(opts.formatters) do
        table.insert(ftf, formatter)
      end

      f[opts.ft] = ftf
    end
  end
  return f
end

return L
