return {
  {
    'nvim-mini/mini.starter',
    version = false,
    config = function()
      require('mini.starter').setup()
    end
  },
  {
    'nvim-mini/mini.icons',
    version = false,
    config = function()
      require('mini.icons').setup()
    end
  },
  {
    'nvim-mini/mini.bufremove',
    version = false,
    config = function()
      require('mini.bufremove').setup()
    end
  },
}
