local _ext = require("utils").extend

local M = {
  prefix = {
    git = "<Leader>g"
  },
  keys = {}
}

M.keys.git = {
  ["n"] = {
    [M.prefix.git .. "p"] = { "Preview git hunk",      require("gitsigns").preview_hunk },
    [M.prefix.git .. "r"] = { "Reset hunk",            require("gitsigns").reset_hunk },
    [M.prefix.git .. "R"] = { "Reset Git buffer",      function() require("gitsigns").reset_buffer() end },

    ["[G"]                = { "First Git hunk",        function() require("gitsigns").nav_hunk "first" end},
    ["]G"]                = { "Last Git hunk",         function() require("gitsigns").nav_hunk "last" end},
    
    ["]g"]                = { "Next git hunk",         require("gitsigns").next_hunk},
    ["[g"]                = { "Previous git hunk",     require("gitsigns").prev_hunk},

  },
  ["v"] = {
    [M.prefix.git .. "r"] = { "Reset hunk",  function() require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" } end }
  },
}

--- Table based API for setting keybindings
---@param map_table A nested table where the first key is the vim mode, the second key is the key to map, and the value is the function to set the mapping to
---@param base? vim.keymap.set.Opts A base set of options to set on every keybinding
function M.set_mappings(map_table, base)
  for mode, maps in pairs(map_table) do
    for keymap, options in pairs(maps) do
      local cmd = options[2]
      local opts = _ext(base, {desc = options[1]})
      vim.keymap.set(mode, keymap, cmd, opts)
    end
  end
end

return M
