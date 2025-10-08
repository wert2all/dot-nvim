local L = {}

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

  vim.lsp.config("*", {
    capabilities = capabilities,
    on_init = function(client, _)
      if client:supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end
  })
end

local lsp_servers = function()
  local servers = {}
  local installed = require("config.languages").installed

  for _, opts in pairs(installed) do
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

function L.lsp_info()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  print("═══════════════════════════════════")
  print("           LSP INFORMATION          ")
  print("═══════════════════════════════════")
  print("")

  -- Basic info
  print("󰈙 Language client log: " .. vim.lsp.get_log_path())
  print("󰈔 Detected filetype: " .. vim.bo.filetype)
  print("󰈮 Buffer: " .. bufnr)
  print("󰈔 Root directory: " .. (vim.fn.getcwd() or "N/A"))
  print("")

  if #clients == 0 then
    print("󰅚 No LSP clients attached to buffer " .. bufnr)
    print("")
    print("Possible reasons:")
    print("  • No language server installed for " .. vim.bo.filetype)
    print("  • Language server not configured")
    print("  • Not in a project root directory")
    print("  • File type not recognized")
    return
  end

  print("󰒋 LSP clients attached to buffer " .. bufnr .. ":")
  print("─────────────────────────────────")

  for i, client in ipairs(clients) do
    print(string.format("󰌘 Client %d: %s", i, client.name))
    print("  ID: " .. client.id)
    print("  Root dir: " .. (client.config.root_dir or "Not set"))
    print("  Command: " .. table.concat(client.config.cmd or {}, " "))
    print("  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

    -- Server status
    if client.is_stopped() then
      print("  Status: 󰅚 Stopped")
    else
      print("  Status: 󰄬 Running")
    end

    -- Workspace folders
    if client.workspace_folders and #client.workspace_folders > 0 then
      print("  Workspace folders:")
      for _, folder in ipairs(client.workspace_folders) do
        print("    • " .. folder.name)
      end
    end

    -- Attached buffers count
    local attached_buffers = {}
    for buf, _ in pairs(client.attached_buffers or {}) do
      table.insert(attached_buffers, buf)
    end
    print("  Attached buffers: " .. #attached_buffers)

    -- Key capabilities
    local caps = client.server_capabilities
    local key_features = {}
    if caps.completionProvider then table.insert(key_features, "completion") end
    if caps.hoverProvider then table.insert(key_features, "hover") end
    if caps.definitionProvider then table.insert(key_features, "definition") end
    if caps.documentFormattingProvider then table.insert(key_features, "formatting") end
    if caps.codeActionProvider then table.insert(key_features, "code_action") end

    if #key_features > 0 then
      print("  Key features: " .. table.concat(key_features, ", "))
    end

    print("")
  end

  -- Diagnostics summary
  local diagnostics = vim.diagnostic.get(bufnr)
  if #diagnostics > 0 then
    print("󰒡 Diagnostics Summary:")
    local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

    for _, diagnostic in ipairs(diagnostics) do
      local severity = vim.diagnostic.severity[diagnostic.severity]
      counts[severity] = counts[severity] + 1
    end

    print("  󰅚 Errors: " .. counts.ERROR)
    print("  󰀪 Warnings: " .. counts.WARN)
    print("  󰋽 Info: " .. counts.INFO)
    print("  󰌶 Hints: " .. counts.HINT)
    print("  Total: " .. #diagnostics)
  else
    print("󰄬 No diagnostics")
  end
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
