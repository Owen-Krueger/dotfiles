return {
  'mason-org/mason.nvim',
  opts = {},
  config = function()
    local mason = require 'mason'

    mason.setup {
      registries = {
        'github:mason-org/mason-registry',
        'github:Crashdummyy/mason-registry',
      },
    }
  end,
}
