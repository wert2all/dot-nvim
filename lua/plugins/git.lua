return {
  {
     "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- local icons = require('config.icons')
      require("gitsigns").setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },

        on_attach = function(bufnr)
          local map = vim.keymap.set
          local ed = function(desc) return {buffer = bufnr, desc = desc} end

          local mapn = function(key, oper, desc) map("n", "<Leader>" .. key, oper, ed(desc) ) end
          local mapv = function(key, oper, desc) map("v", "<Leader>" .. key, oper, ed(desc) ) end

          mapn("p", require("gitsigns").preview_hunk, "Preview git hunk")

          mapn("r", require("gitsigns").reset_hunk, "Reset hunk")
          mapv("r", function() require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" } end, "Reset hunk")
          mapn("R", function() require("gitsigns").reset_buffer() end, "Reset Git buffer")

          map("n", "[G", function() require("gitsigns").nav_hunk "first" end, ed("First Git hunk"))
          map("n", "]G", function() require("gitsigns").nav_hunk "last" end,  ed("Last Git hunk"))

          map("n", "]g", require("gitsigns").next_hunk, ed("Next git hunk"))
          map("n", "[g", require("gitsigns").prev_hunk, ed("Previous git hunk"))
        end,
      })
    end,
  },
}
