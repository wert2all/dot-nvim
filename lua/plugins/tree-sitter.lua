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
    },
    config = function(_, opts)
      local ensure_installed = require("config.languages").treesitter()

      require("nvim-treesitter.configs").setup(
        require("utils").extend(opts, {ensure_installed = ensure_installed })
      )
    end
}
