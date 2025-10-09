-- LSPs - https://github.com/neovim/nvim-lspconfig/tree/master/lsp

local L = {
  installed = {
    lua             = require("config.languages.lua"),
    bash            = require("config.languages.bash"),
    markdown        = require("config.languages.markdown"),
    markdown_inline = {},
    yaml            = require("config.languages.yaml"),
  }
}


local function exposeFileTypes(lsp_config)
  local filetypes = {}
  for _, config in pairs(lsp_config) do
    if config.filetypes then
      for _, ft in pairs(config.filetypes) do
        table.insert(filetypes, ft)
      end
    end
  end

  return filetypes
end

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
    if opts.formatters and opts.lsp then
      local filetypes = exposeFileTypes(opts.lsp)
      local formatters = opts.formatters

      for _, ft in pairs(filetypes) do
        f[ft] = formatters
      end
    end
  end
  return f
end

return L
