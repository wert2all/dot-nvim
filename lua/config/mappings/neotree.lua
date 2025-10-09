return function()
  local keymap = {
    ["<Leader>e"] = { "Toggle neo-tree", "<cmd>Neotree float reveal<cr>" },
  }
  return {
    ["n"] = keymap,
    ["v"] = keymap,
  }
end
