-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
--vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
--vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
--vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
--vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Yank/Paste from system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, '<leader>p', [["+p]])
vim.keymap.set('n', '<leader>P', [["+P]])

-- Dotnet commands
vim.keymap.set('n', '<leader>nb', ':!dotnet build<CR>')
vim.keymap.set('n', '<leader>nr', ':!dotnet run<CR>')
vim.keymap.set('n', '<leader>nt', ':!dotnet test<CR>')
vim.keymap.set('n', '<leader>npl', ':!dotnet package list<CR>')

-- When in normal mode, search the line for the package name.
-- Package search
vim.keymap.set('n', '<leader>nps', function()
  local line = vim.fn.getline '.'
  local pkg = string.match(line, 'Include="(.-)"')
  if pkg then
    vim.cmd('!' .. 'dotnet package search ' .. pkg)
  else
    vim.notify('No package found on this line', vim.log.levels.WARN)
  end
end, { desc = 'Search NuGet package version' })

-- Package update
vim.keymap.set('n', '<leader>npu', function()
  local line = vim.fn.getline '.'
  local pkg = string.match(line, 'Include="(.-)"')
  if pkg then
    vim.cmd('!' .. 'dotnet package update ' .. pkg)
  else
    vim.notify('No package found on this line', vim.log.levels.WARN)
  end
end, { desc = 'Search NuGet package version' })
