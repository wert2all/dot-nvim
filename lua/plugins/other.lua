return {
  "rgroli/other.nvim",
  event = "BufRead",
  opts = {
    mappings = { "angular", "golang" },
  },
  config = function(_, opts) require("other-nvim").setup(opts) end,
}
