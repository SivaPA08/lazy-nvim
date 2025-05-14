-- ~/.config/nvim/lua/plugins/treesitter.lua
local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { "c", "cpp", "python", "go", "javascript" },
      auto_install     = true,          -- <–– install missing parsers on BufRead
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.cmd("highlight! link TSError DiagnosticError")
      -- wrap sign_define in a pcall so it can’t ever throw
      pcall(vim.fn.sign_define, "TSError", {
        text   = "",
        texthl = "DiagnosticError",
        linehl = "",
        numhl  = "",
      })
    end,
  },
}

return M

