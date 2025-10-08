local L = {
  installed = {
    lua  = require("config.languages.lua"),
    bash = require("config.languages.bash"),
  }
}

function L.treesitter()
  local l = {}
  for lang, _ in pairs(L.installed) do
    table.insert(l, lang)
  end
  return l
end

return L
