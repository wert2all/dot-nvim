return function(prefix)
  return {
    ["n"] = {
      ["gd"]          = { "Go to definition", vim.lsp.buf.definition },
      ["gD"]          = { "Go to declaration", vim.lsp.buf.declaration },
      ["grn"]         = { "Rename", vim.lsp.buf.rename },
      ["gra"]         = { "Code actions", vim.lsp.buf.code_action },
      ["grr"]         = { "References", vim.lsp.buf.references },
      ["gri"]         = { "Implementation", vim.lsp.buf.implementation },
      ["gy"]          = { "Definition of current type", vim.lsp.buf.type_definition },

      [prefix .. 'a'] = { "Code actions", vim.lsp.buf.code_action },
      [prefix .. 'r'] = { "Rename", vim.lsp.buf.rename },
      [prefix .. "R"] = { "References", vim.lsp.buf.references },
      [prefix .. "n"] = { "Signature Help", vim.lsp.buf.signature_help },
      [prefix .. "f"] = { "Format", function()
        print(vim.inspect(vim.api.nvim_get_current_buf()))
        require("conform").format()
      end },
    },
    ["i"] = {
      ["<C-S>"] = { "Signature Help", vim.lsp.buf.signature_help },
    },
  }
end
