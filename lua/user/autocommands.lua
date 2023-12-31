-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- USER COMMANDS --
vim.api.nvim_create_user_command('Q', function() vim.cmd("q") end, { nargs = 0 })
vim.api.nvim_create_user_command('W', function() vim.cmd("w") end, { nargs = 0 })

-- autocommand, który sprawia, że pisząc komentarz nie wstawia ci się w nowej linii początek Komentarza
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

