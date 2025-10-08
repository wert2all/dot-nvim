local L = {
  installed = {
    lua = {
      lsp = {
        lua_ls = {
          filetypes = {'lua'},
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
  for lang, opts in pairs(L.installed) do
    table.insert(l, lang)
  end
  return l
end

function L.lsp()
  local l = {}
  for lang, opts in pairs(L.installed) do
    if opts.lsp then
      for name, config in pairs(opts.lsp) do
        l[name] = config
      end
    end
  end
  return l;
end

function L.mason()
  local servers = L.lsp()
  local m = {}
  for name, cfg in pairs(servers) do
    table.insert(m, name)
  end
  return m
end

return L
