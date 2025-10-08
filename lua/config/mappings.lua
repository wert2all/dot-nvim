local _ext = require("utils.core").extend

local M = {
  prefix = {
    git      = "<Leader>g",
    buffer   = "<Leader>b",
    lsp      = "<Leader>l",

    next     = "]",
    previous = "[",
    go       = "g",
  },
  keys = {}
}

M.keys.core = {
  ["n"] = {
    -- Keep cursor centered when scrolling and searching
    ["<C-d>"] = { nil, "<C-d>zz" },
    ["<C-u>"] = { nil, "<C-u>zz" },
    ["n"] = { nil, "nzzv" },
    ["N"] = { nil, "Nzzv" },

    -- next and previous buffer
    ["]b"] = { "Next buffer", ":bnext<CR>" },
    ["[b"] = { "Previous buffer", ":bprevious<CR>" },

    -- quit
    ["<C-q>"] = { nil, ":q!<CR>" },
  },
  ["v"] = {
    -- better indenting
    ["<"] = { nil, "<gv" },
    [">"] = { nil, ">gv" },

    -- paste over currently selected text without yanking it
    ["p"] = { nil, '"_dp' },
    ["P"] = { nil, '"_dP' },
  }
}

M.keys.git = {
  ["n"] = {
    [M.prefix.git .. "p"] = { "Preview git hunk", require("gitsigns").preview_hunk },
    [M.prefix.git .. "r"] = { "Reset hunk", require("gitsigns").reset_hunk },
    [M.prefix.git .. "R"] = { "Reset Git buffer", function() require("gitsigns").reset_buffer() end },

    ["[G"]                = { "First Git hunk", function() require("gitsigns").nav_hunk "first" end },
    ["]G"]                = { "Last Git hunk", function() require("gitsigns").nav_hunk "last" end },

    ["]g"]                = { "Next git hunk", require("gitsigns").next_hunk },
    ["[g"]                = { "Previous git hunk", require("gitsigns").prev_hunk },

  },
  ["v"] = {
    [M.prefix.git .. "r"] = { "Reset hunk", function() require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" } end }
  },
}

M.keys.buffer = {
  ["n"] = {
    ["<Leader>c"] = { "Close current buffer",
      function()
        local current = vim.api.nvim_get_current_buf()
        require('mini.bufremove').delete(current)
        local bufs = vim.fn.getbufinfo { buflisted = 1 }
        if not bufs[2] then
          require("mini.starter").open()
        end
      end
    },
    [M.prefix.buffer .. "c"] = { "Close all buffers except current",
      function()
        local minibufremove = require('mini.bufremove')
        local current = vim.api.nvim_get_current_buf()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        for _, buf in ipairs(bufs) do
          local bufnr = buf.bufnr
          if bufnr ~= current then minibufremove.delete(bufnr, false) end
        end
      end
    },
    [M.prefix.buffer .. "C"] = { "Close all buffers",
      function()
        local minibufremove = require('mini.bufremove')
        local bufs = vim.fn.getbufinfo { buflisted = true }
        for _, buf in ipairs(bufs) do
          minibufremove.delete(buf.bufnr, false)
        end
      end
    },
  },
  ["v"] = {
  }
}

M.keys.neotree = {
  ["n"] = {
    ["<Leader>e"] = { "Toggle neo-tree", "<cmd>Neotree float reveal<cr>" },
  },
  ["v"] = {
    ["<Leader>e"] = { "Toggle neo-tree", "<cmd>Neotree float reveal<cr>" },
  },
}

M.keys.lsp = {
  ["n"] = {
    ["gd"]                = { "Go to definition", vim.lsp.buf.definition },
    ["gD"]                = { "Go to declaration", vim.lsp.buf.declaration },
    ["grn"]               = { "Rename", vim.lsp.buf.rename },
    ["gra"]               = { "Code actions", vim.lsp.buf.code_action },
    ["grr"]               = { "References", vim.lsp.buf.references },
    ["gri"]               = { "Implementation", vim.lsp.buf.implementation },
    ["gy"]                = { "Definition of current type", vim.lsp.buf.type_definition },

    [M.prefix.lsp .. 'a'] = { "Code actions", vim.lsp.buf.code_action },
    [M.prefix.lsp .. 'r'] = { "Rename", vim.lsp.buf.rename },
    [M.prefix.lsp .. "R"] = { "References", vim.lsp.buf.references },
    [M.prefix.lsp .. "n"] = { "Signature Help", vim.lsp.buf.signature_help },
    [M.prefix.lsp .. "f"] = { "Format", vim.lsp.buf.format },
  },
  ["i"] = {
    ["<C-S>"] = { "Signature Help", vim.lsp.buf.signature_help },
  },
}

--- Table based API for setting keybindings
---@param map_table A nested table where the first key is the vim mode, the second key is the key to map, and the value is the function to set the mapping to
---@param base? vim.keymap.set.Opts A base set of options to set on every keybinding
function M.set_mappings(map_table, base)
  for mode, maps in pairs(map_table) do
    for keymap, options in pairs(maps) do
      local cmd = options[2]
      local opts = _ext(base, { desc = options[1] })
      vim.keymap.set(mode, keymap, cmd, opts)
    end
  end
end

function M.which_spec()
  local groups = { mode = { "n", "v" } }
  for desc, prefix in pairs(M.prefix) do
    table.insert(groups, { prefix, ["group"] = desc })
  end

  return groups
end

M.set_mappings(M.keys.core, { noremap = true, silent = true })
M.set_mappings(M.keys.buffer, { noremap = true, silent = true })


return M
