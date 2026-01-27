return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true }
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { 'stylua' },
      cs = { 'csharpier' },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = 'fallback',
    },
    -- Set up format-on-save
    --format_on_save = { timeout_ms = 5000 },
    format_on_save = function(bufnr)
      -- Disable autoformat on certain filetypes. For some reason, csharpier takes a couple seconds, so I'd rather use the format command than hold up every write I do.
      local ignore_filetypes = { 'cs' }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
      end

      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
    -- Customize formatters
    formatters = {},
  },
}
