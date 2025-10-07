local M = {
  map = {}
}

function M.extend(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

return M
