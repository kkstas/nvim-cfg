if vim.g.neovide then
  -- vim.o.guifont = 'JetBrainsMonoNL Nerd Font:h13'
  -- vim.o.guifont = 'JetBrainsMono Nerd Font Propo:h13'
  vim.o.guifont = 'VictorMono Nerd Font Propo:h14.5'
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.05)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.05)
  end)

  -- MAKE MACOS CLIPBOARD WORK WITH NEOVIDE --
  -- https://github.com/codeitlikemiley/nvim/blob/15a0b722346d1d9879ae780344018c2d29bde95f/lua/config/keymaps/clipboard.lua

  if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
    vim.keymap.set("v", "<D-c>", '"+y')             -- Copy on visual mode
    vim.keymap.set("n", "<D-v>", '"+P')             -- Paste normal mode
    vim.keymap.set("v", "<D-v>", '"+P')             -- Paste visual mode
    vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli')     -- Paste insert mode
    vim.keymap.set("c", "<D-v>", "<C-R>+<Space><BS>") -- Paste command mode
    vim.keymap.set("t", "<D-v>", "<C-R>+")          -- Paste terminal mode
    vim.keymap.set("!", "<D-v>", "<C-R>+<Space><BS>") -- Paste on :! mode
  end
end
