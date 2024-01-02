-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>lp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>ln', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>lf', ':Format<CR>', { desc = 'Format' })

vim.keymap.set('n', 'J', function()
    local float = vim.diagnostic.config().float
    if float then
      local config = type(float) == 'table' and float or {}
      config.scope = 'line'
      vim.diagnostic.open_float(config)
    end
  end,
  { desc = 'Open floating diagnostic message' }
)

vim.keymap.set('n', '<leader>ll', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- dla foldów z nvim-ufo
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)

vim.keymap.set('n', '<leader>v', require('ufo').peekFoldedLinesUnderCursor, { desc = 'Peek fold' })
--
vim.keymap.set('v',"<","<gv")
vim.keymap.set('v',">",">gv")

-- ESC also clears search highlighting
vim.keymap.set('n', '<ESC>', ':nohlsearch<Bar>:echo<CR>', { silent = true, noremap = true })

vim.keymap.set('n', "<C-h>", "<C-w>h")
vim.keymap.set('n', "<C-j>", "<C-w>j")
vim.keymap.set('n', "<C-k>", "<C-w>k")
vim.keymap.set('n', "<C-l>", "<C-w>l")

-- numToStr/Navigator.nvim <-> WezTerm - przechodzenie między panes/splits przy <C-hjkl>
vim.keymap.set('n', "<C-h>", "<CMD>NavigatorLeft<CR>")
vim.keymap.set('t', "<C-h>", "<CMD>NavigatorLeft<CR>")
vim.keymap.set('n', "<C-j>", "<CMD>NavigatorDown<CR>")
vim.keymap.set('t', "<C-j>", "<CMD>NavigatorDown<CR>")
vim.keymap.set('n', "<C-k>", "<CMD>NavigatorUp<CR>")
vim.keymap.set('t', "<C-k>", "<CMD>NavigatorUp<CR>")
vim.keymap.set('n', "<C-l>", "<CMD>NavigatorRight<CR>")
vim.keymap.set('t', "<C-l>", "<CMD>NavigatorRight<CR>")
vim.keymap.set('n', "<C-p>", "<CMD>NavigatorPrevious<CR>")
vim.keymap.set('t', "<C-p>", "<CMD>NavigatorPrevious<CR>")
--



local cmp = require("cmp")
vim.keymap.set('i', "<C-i>", cmp.mapping.complete(), { desc = 'trigger cmp complete' })

vim.keymap.set('n', "<C-8>", ":bNext<CR>")
vim.keymap.set('n', "<C-7>", ":bprevious<CR>")


-- w Wezterm (i VSCodium) masz Shift + Ctrl + Up/Down/Left/Right arrow
-- na resize. Dlatego - żeby nie kolidował NVIM z Wezterm,
-- tutaj resize jest za pomocą Shift + Arrows
vim.keymap.set('n', "<S-Up>", ":resize -2<CR>")
vim.keymap.set('n', "<S-Down>", ":resize +2<CR>")
vim.keymap.set('n', "<S-Left>", ":vertical resize -2<CR>")
vim.keymap.set('n', "<S-Right>", ":vertical resize +2<CR>")

vim.keymap.set('n', "<leader>d", ":bd<CR>", { desc = 'Close buffer' })

vim.keymap.set('n', "<leader>wv", ":vsplit<CR>", { desc = 'vertical split' })
vim.keymap.set('n', "<leader>ws", ":split<CR>", { desc = 'horizontal split' })

vim.keymap.set('n', "<leader>k", ":join!<CR>", { desc = "łącz linię bez spacji" })
vim.keymap.set('n', "<leader>j", ":join<CR>", { desc = "łącz linię ze spacją" })


vim.keymap.set('n', '<C-u>', '4k')
vim.keymap.set('n', '<C-d>', '4j')

-- x - visual-block mode
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv")
