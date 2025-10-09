return {
  ft = "lua",
  lsp = {
    lua_ls = {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
      },
      settings = {
        Lua = {
          workspace = {
            library = {
              vim.fn.expand("$VIMRUNTIME/lua"),
              vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
            },
          },
        },
      },
      single_file_support = true,
      log_level = vim.lsp.protocol.MessageType.Warning,
    },
  },
  mason = { "lua-language-server", "stylua" },
  formatters = {},
}
