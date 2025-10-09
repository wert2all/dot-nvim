local _ext = require("utils.core").extend

local keys = {}
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

keys.core = {
  ["n"] = {
    -- Keep cursor centered when scrolling and searching
    ["<C-d>"] = { nil, "<C-d>zz" },
    ["<C-u>"] = { nil, "<C-u>zz" },
    ["n"] = { nil, "nzzv" },
    ["N"] = { nil, "Nzzv" },

    -- move by split windows
    ["<C-h>"] = { "Move to left split", "<C-w>h" },
    ["<C-j>"] = { "Move to below split", "<C-w>j" },
    ["<C-k>"] = { "Move to above split", "<C-w>k" },
    ["<C-l>"] = { "Move to right split", "<C-w>l" },

    -- rezizing split windows
    ["<C-Up>"] = { "Resize split up", "<Cmd>resize -2<CR>" },
    ["<C-Down>"] = { "Resize split down", "<Cmd>resize +2<CR>" },
    ["<C-Left>"] = { "Resize split left", "<Cmd>vertical resize -2<CR>" },
    ["<C-Right>"] = { "Resize split right", "<Cmd>vertical resize +2<CR>" },

    -- next and previous buffer
    ["]b"] = { "Next buffer", ":bnext<CR>" },
    ["[b"] = { "Previous buffer", ":bprevious<CR>" },

    -- new obsidian note

    [M.prefix.obsidian .. 'n'] = { "New note",
      function()
        require "obsidian"
        vim.api.nvim_command("Obsidian new inbox/" .. os.date "%Y-%m-%d" .. "-note.md")
      end,
    },

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

keys.git = {
  ["n"] = {
    [M.prefix.git .. "p"] = { "Preview git hunk", require("gitsigns").preview_hunk },
    [M.prefix.git .. "r"] = { "Reset hunk", require("gitsigns").reset_hunk },
    [M.prefix.git .. "R"] = { "Reset Git buffer", function() require("gitsigns").reset_buffer() end },
    [M.prefix.git .. "l"] = { "Git log", function() Snacks.picker.git_log() end },

    ["[G"]                = { "First Git hunk", function() require("gitsigns").nav_hunk('first') end },
    ["]G"]                = { "Last Git hunk", function() require("gitsigns").nav_hunk('last') end },

    ["]g"]                = { "Next git hunk", function() require("gitsigns").nav_hunk('next') end },
    ["[g"]                = { "Previous git hunk", function() require("gitsigns").nav_hunk('prev') end },

  },
  ["v"] = {
    [M.prefix.git .. "r"] = { "Reset hunk", function() require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" } end }
  },
}

keys.buffer = {
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

keys.neotree = {
  ["n"] = {
    ["<Leader>e"] = { "Toggle neo-tree", "<cmd>Neotree float reveal<cr>" },
  },
  ["v"] = {
    ["<Leader>e"] = { "Toggle neo-tree", "<cmd>Neotree float reveal<cr>" },
  },
}

keys.lsp = {
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
    [M.prefix.lsp .. "f"] = { "Format", function()
      print(vim.inspect(vim.api.nvim_get_current_buf()))
      require("conform").format()
    end },
  },
  ["i"] = {
    ["<C-S>"] = { "Signature Help", vim.lsp.buf.signature_help },
  },
}

keys.files = {
  ["n"] = {
    [M.prefix.files .. "f"] = { "Find file", function() Snacks.picker.files() end },
    [M.prefix.files .. "r"] = { "Find word", function() Snacks.picker.recent() end },
    [M.prefix.files .. "w"] = { "Find word", function() Snacks.picker.grep() end },
    [M.prefix.files .. "b"] = { "Buffers", function() Snacks.picker.buffers() end },
    [M.prefix.files .. "g"] = { "Git changes", function() Snacks.picker.git_status() end },
  },
}

keys.obsidian = {}

local function set_mappings(map_table, base)
  for mode, maps in pairs(map_table) do
    for keymap, options in pairs(maps) do
      local cmd = options[2]
      local opts = _ext(base, { desc = options[1] })
      vim.keymap.set(mode, keymap, cmd, opts)
    end
  end
end

function M.map_group(group, base)
  if keys[group] then
    set_mappings(keys[group], base)
  end
end

return M
