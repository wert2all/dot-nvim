return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    disable_netrw = true,
    enable_git_status = true,
    enable_diagnostics = true,
    sync_root_with_cwd = true,

    popup_border_style = "",
    close_if_last_window = true,
    follow_current_file = {
      enabled = true,
    },
    sources = { "filesystem" },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)
    require("utils.mappings").map_group("neotree", {})
  end
}
