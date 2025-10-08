return {
   "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      sync_install = false,
          highlight = {
              enable = true,
              additional_vim_regex_highlighting = false,
          },
          indent = { enable = true },
          auto_install = false,
      ensure_installed = {
        "lua"
      }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
}
