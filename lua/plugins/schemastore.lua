local ext = require("utils.core").extend
local updateSchema = function(name, schemas)
  if vim.lsp.config[name] then
    local config = vim.lsp.config[name]

    config.settings = config.settings or {}
    config.settings.schemas = config.settings.schemas or {}
    config.settings.schemas = ext(config.settings.schemas, schemas)

    vim.lsp.config(name, config)
  end
end

return {
  "b0o/schemastore.nvim",
  config = function()
    local store = require("schemastore")

    updateSchema("yaml", store.yaml.schemas())
    updateSchema("jsonls", store.json.schemas())
  end,
}
