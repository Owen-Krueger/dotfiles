return {
  'GustavEikaas/easy-dotnet.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    local dotnet = require 'easy-dotnet'
    dotnet.setup {
      auto_bootstrap_namespace = {
        type = 'file_scoped',
        enabled = true,
      },
      --mappings = {
      --run_test_from_buffer = { lhs = '<leader>r', desc = 'run test from buffer' },
      --run_all_tests_from_buffer = { lhs = '<leader>t', desc = 'run all tests from buffer' },
      --peek_stack_trace_from_buffer = { lhs = '<leader>p', desc = 'peek stack trace from buffer' },
      --filter_failed_tests = { lhs = '<leader>fe', desc = 'filter failed tests' },
      --debug_test = { lhs = '<leader>d', desc = 'debug test' },
      --go_to_file = { lhs = 'g', desc = 'go to file' },
      --run_all = { lhs = '<leader>R', desc = 'run all tests' },
      --run = { lhs = '<leader>r', desc = 'run test' },
      --peek_stacktrace = { lhs = '<leader>p', desc = 'peek stacktrace of failed test' },
      --expand = { lhs = 'o', desc = 'expand' },
      --expand_node = { lhs = 'E', desc = 'expand node' },
      --expand_all = { lhs = '-', desc = 'expand all' },
      --collapse_all = { lhs = 'W', desc = 'collapse all' },
      --close = { lhs = 'q', desc = 'close testrunner' },
      --refresh_testrunner = { lhs = '<C-r>', desc = 'refresh testrunner' },
      --},
      vim.keymap.set('n', '<leader>ns', function()
        dotnet.secrets()
      end, { desc = 'Secrets' }),
      -- Dotnet commands
      vim.keymap.set('n', '<leader>nb', ':!dotnet build<CR>', { desc = 'Build solution' }),
      vim.keymap.set('n', '<leader>nr', ':!dotnet run<CR>', { desc = 'Run solution' }),

      -- Tests
      vim.keymap.set('n', '<leader>ntt', ':!dotnet test<CR>', { desc = 'Run tests' }),
      vim.keymap.set('n', '<leader>ntr', function()
        dotnet.testrunner()
      end, { desc = 'Open test runner' }),

      -- Packages
      vim.keymap.set('n', '<leader>npl', ':!dotnet package list<CR>', { desc = 'List NuGet packages' }),

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
      end, { desc = 'Search NuGet package version' }),

      -- Package update
      vim.keymap.set('n', '<leader>npu', function()
        local line = vim.fn.getline '.'
        local pkg = string.match(line, 'Include="(.-)"')
        if pkg then
          vim.cmd('!' .. 'dotnet package update ' .. pkg)
        else
          vim.notify('No package found on this line', vim.log.levels.WARN)
        end
      end, { desc = 'Search NuGet package version' }),
    }
  end,
}
