return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    dependencies = {
      -- NOTE: additional parser
      { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
    },
    opts = require "configs.treesitter",
  },
}
