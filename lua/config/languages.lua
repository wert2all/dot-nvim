local L = {
  installed = {
    lua = {
      lsp = {
        lua_ls = {
          cmd ={ 'lua-language-server'},
          filetypes = {'lua'},
          root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	  },
          settings = {
            Lua = {
              workspace = {
                library = {
                  vim.fn.expand "$VIMRUNTIME/lua",
                  vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                },
              },
            },
          },
          single_file_support = true,
          log_level = vim.lsp.protocol.MessageType.Warning,
        }
      },
    },
    bash = {
      lsp = {bashls = {}}
    },
  }
}

function L.treesitter()
  local l = {}
  for lang, _ in pairs(L.installed) do
    table.insert(l, lang)
  end
  return l
end

return L
