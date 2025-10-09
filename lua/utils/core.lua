local M = {}

function M.extend(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

function M.d(value)
  print(vim.inspect(value))
end

return M
