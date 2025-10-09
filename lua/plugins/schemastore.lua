return {
  "b0o/schemastore.nvim",
  config = function()
    local store = require("schemastore")

    require("utils.lsp").update("yamlls", { settings = { schemas = store.yaml.schemas() }, })
  end,
}
