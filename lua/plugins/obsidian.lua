local vaultDirectory = "Documents/obsidian"

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  event = { "BufReadPre " .. vim.fn.expand "~/" .. vaultDirectory .. "/**.md" },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      {
        path = vim.env.HOME .. "/" .. vaultDirectory,
      },
    },
    picker = { name = "snacks.pick" },
    open = {
      use_advanced_uri = true,
    },
    templates = {
      folder = "Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
    daily_notes = {
      folder = "Daily",
      workdays_only = false,
    },

    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
      match_case = true,
      create_new = true,
    },
  }
}
