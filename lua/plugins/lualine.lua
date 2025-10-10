return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    "meuter/lualine-so-fancy.nvim",
  },
  opts = {
    options = {
      theme = "auto",
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { "fancy_mode", width = 3 }
      },
      lualine_b = {
        { "fancy_branch" },
        { "fancy_diff" },
      },
      lualine_c = {
        { "fancy_cwd", substitute_home = true }
      },
      lualine_x = {
        { "fancy_macro" },
        { "fancy_diagnostics" },
        { "fancy_searchcount" },
        { "fancy_location" },
      },
      lualine_y = {
        { "fancy_filetype", ts_icon = "" }
      },
      lualine_z = {
        { "fancy_lsp_servers" }
      },
    }
  },
  config = function(_, opts)
    require('lualine').setup(opts)
  end,
}
