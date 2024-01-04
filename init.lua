--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('user.neovide')
require('user.plugins')
require('user.options')
require('user.keymaps')
require('user.autocommands')
require('user.telescope')
require('user.treesitter')
require('user.lsp')

-- only set if NEOVIDE_CWD is set ------------------------------------
-- https://github.com/neovide/neovide/discussions/1984 ---------------
if vim.fn.exists("neovide") == 1 and vim.fn.getenv("NEOVIDE_CWD") then
  vim.fn.chdir(vim.fn.getenv("NEOVIDE_CWD")) -------------------------
end ------------------------------------------------------------------
----------------------------------------------------------------------

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
