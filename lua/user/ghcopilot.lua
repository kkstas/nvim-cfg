

vim.keymap.set(
  'n', '<leader>ct',
  require('copilot.suggestion').toggle_auto_trigger,
  { noremap = true, silent = true, desc = '[C]opilot [T]oggle_auto_trigger()' }
)

local M = {
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "<C-;>",
      jump_next = "<C-'>",
      accept = "<C-CR>",
      refresh = "gr",
      open = "<C-S-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-CR>",
      accept_word = false,
      accept_line = false,
      next = "<C-'>",
      prev = "<C-;>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
}

return M
