return {
  {
    'OXY2DEV/markview.nvim',
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway
    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local heading_presets = require('markview.presets').headings
      local hl_presets = require('markview.presets').highlight_groups

      require('markview').setup {
        highlight_groups = hl_presets.h_decorated,
        headings = heading_presets.decorated_labels,
      }

      tables = {
        enable = true,
        use_virt_lines = true,

        text = {},
        hl = {},
      }

      code_blocks = {
        position = nil,
        min_width = 70,
        max_width = 100,

        pad_amount = 1.5,
      }

      require('markview').setup {
        modes = { 'n', 'i', 'no', 'c' },
        hybrid_modes = { 'i' },

        -- This is nice to have
        callbacks = {
          on_enable = function(_, win)
            vim.wo[win].conceallevel = 2
            vim.wo[win].concealcursor = 'nc'
          end,
        },
      }
    end,
  },
}
