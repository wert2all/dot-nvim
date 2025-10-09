-- LSPs - https://github.com/neovim/nvim-lspconfig/tree/master/lsp

local L = {
  installed = {
    lua             = require("config.languages.lua"),
    bash            = require("config.languages.bash"),
    markdown        = require("config.languages.markdown"),
    markdown_inline = {},
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
