--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('user.plugins')
require('user.options')
require('user.keymaps')
require('user.autocommands')
require('user.telescope')
require('user.treesitter')
require('user.lsp')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
