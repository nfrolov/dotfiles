vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('u.plugins', {
  defaults = {
    lazy = false,
  },
  install = {
    missing = false,
  },
  ui = {
    backdrop = 100,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        -- 'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
