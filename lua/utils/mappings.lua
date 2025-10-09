local M = {}
local keys = require("config.mappings").keys
local _ext = require("utils.core").extend

local function set_mappings(map_table, base)
  for mode, maps in pairs(map_table) do
    for keymap, options in pairs(maps) do
      local cmd = options[2]
      local opts = _ext(base, { desc = options[1] })
      vim.keymap.set(mode, keymap, cmd, opts)
    end
  end
end

function M.map_group(group, base)
  if keys[group] then
    set_mappings(keys[group], base)
  end
end

return M
