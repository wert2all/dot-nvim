local languages = require("config.languages")
local L = {}

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

  for _, language in pairs(languages) do
    if language.filetypes then
      for k, _ in pairs(language.filetypes) do
        f[k] = language.filetypes[k].formatters
      end
    end
  end
  return f
end

return L
