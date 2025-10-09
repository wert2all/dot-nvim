return function(obsidian_prefix)
  return {
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

      [obsidian_prefix .. 'n'] = { "New note",
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
end
