return {
  {
     "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
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
          local mappings = require("config.mappings")
          mappings.set_mappings( mappings.keys.git, { buffer = bufnr})
        end,
      })
    end,
  },
}
