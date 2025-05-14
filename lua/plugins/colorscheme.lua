return {
  -- Add Rose Pine with super dark settings
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000, -- Ensure it loads first
    config = function()
      require('rose-pine').setup({
        variant = 'moon',       -- The darkest variant
        dark_variant = 'moon',  -- Force dark mode
        styles = {
          transparency = false, -- Disable transparency effects
        },
        highlight_groups = {
          -- Extra dark customizations
          Normal = { bg = '#0f0f15' },           -- Darker background
          NormalNC = { bg = '#0f0f15' },         -- Non-current windows
          CursorLine = { bg = '#1a1a25' },       -- Darker cursor line
          Visual = { bg = '#252535' },           -- Darker visual selection
          Pmenu = { bg = '#0f0f15', fg = '#e0def4' }, -- Darker popup menu
        }
      })
      vim.cmd.colorscheme('rose-pine') -- Apply immediately
    end
  },

  -- Configure LazyVim to use our setup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine", -- Ensure LazyVim doesn't override our config
    },
  }
}
