local languages = require("config.languages")
local L = {}

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
  for _, language in pairs(languages) do
    if language.treesitter then
      for _, ft in pairs(language.treesitter) do
        table.insert(l, ft)
      end
    end
  end
  return l
end

function L.formatters()
  local f = {}

  for _, opts in pairs(languages.installed) do
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
