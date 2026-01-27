return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED: Initialize Harpoon
    harpoon:setup()

    -- Key mappings
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Add file to Harpoon' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open Harpoon quick menu' })

    -- Jump to specific harpooned files (1-4)
    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():select(1)
    end, { desc = 'Jump to file 1' })
    vim.keymap.set('n', '<C-t>', function()
      harpoon:list():select(2)
    end, { desc = 'Jump to file 2' })
    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():select(3)
    end, { desc = 'Jump to file 3' })
    vim.keymap.set('n', '<C-s>', function()
      harpoon:list():select(4)
    end, { desc = 'Jump to file 4' })

    -- Navigate between harpooned files
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end, { desc = 'Previous harpooned file' })
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end, { desc = 'Next harpooned file' })
  end,
}
