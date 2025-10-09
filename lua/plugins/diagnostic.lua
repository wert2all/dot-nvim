return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    preset = "powerline",
    signs = {
      diag = "󰅚",
    },
  },
  config = function(_, opts)
    require('tiny-inline-diagnostic').setup(opts)

    -- Disable default virtual text
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
    })
  end
}
