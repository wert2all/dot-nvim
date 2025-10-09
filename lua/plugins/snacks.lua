return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true, },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = true },
      zen = { enabled = true },
    },
    config = function(_, opts)
      require("snacks").setup(opts)
      require("utils.mappings").map_group("files", {})

      -- zen-mode
      vim.api.nvim_create_user_command('Zen', function() Snacks.zen() end, { desc = "Toggle zen mode" })
    end,
  }
}
