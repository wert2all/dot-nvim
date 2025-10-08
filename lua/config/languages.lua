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

local initLsp = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    },
  }

  vim.lsp.config("*", { capabilities = capabilities, on_init = function(client, _)
    if client:supports_method "textDocument/semanticTokens" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end
 })
end

local lsp_servers = function()
  local servers = {}
  for _, opts in pairs(L.installed) do
    if opts.lsp then
      for name, config in pairs(opts.lsp) do
        servers[name] = config
      end
    end
  end
  return servers;
end
function L.lsp_servers()
  initLsp()
  return lsp_servers()
end

function L.mason()
  local servers = lsp_servers()
  local m = {}
  for name, _ in pairs(servers) do
    table.insert(m, name)
  end
  return m
end

return L
