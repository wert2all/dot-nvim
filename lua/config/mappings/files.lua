return function(prefix)
  return {
    ["n"] = {
      [prefix .. "f"] = { "Find file", function() Snacks.picker.files() end },
      [prefix .. "r"] = { "Find word", function() Snacks.picker.recent() end },
      [prefix .. "w"] = { "Find word", function() Snacks.picker.grep() end },
      [prefix .. "b"] = { "Buffers", function() Snacks.picker.buffers() end },
      [prefix .. "g"] = { "Git changes", function() Snacks.picker.git_status() end },
    },
  }
end
