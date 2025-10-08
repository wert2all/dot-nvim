local L = {
  installed = {
    lua  = {},
    bash = {},
  }
}

function L.treesitter()
  local l = {}
  for lang, opts in pairs(L.installed) do
    table.insert(l, lang)
  end
  return l
end

return L
