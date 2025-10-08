return {
  "rgroli/other.nvim",
  opts = {
    mappings = { "angular", "golang" },
  },
  config = function(_, opts) require("other-nvim").setup(opts) end,
}
