local M = {
  prefix = {
    git      = "<Leader>g",
    buffer   = "<Leader>b",
    lsp      = "<Leader>l",
    files    = "<Leader>f",
    obsidian = "<Leader>O",

    next     = "]",
    previous = "[",
    go       = "g",
  },
}

M.keys = {
  core     = require("config.mappings.core")(M.prefix.obsidian),
  buffer   = require("config.mappings.buffer")(M.prefix.buffer),
  git      = require("config.mappings.git")(M.prefix.git),
  lsp      = require("config.mappings.lsp")(M.prefix.lsp),
  files    = require("config.mappings.files")(M.prefix.files),
  neotree  = require("config.mappings.neotree")(),
  obsidian = {
    ["n"] = {
      [M.prefix.obsidian] = { "Toggle preview", ":Markview<CR>" }
    },
  },
}

return M
