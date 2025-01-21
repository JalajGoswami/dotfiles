local options = {
  ensure_installed = { "stylua", "prettierd", "gofmt", "goimports" },
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    -- You can customize some of the format options for the filetype (:help conform.format)
    -- Conform will run the first available formatter
    css = { "prettierd" },
    html = { "prettierd" },
    lua = { "stylua" },
    python = { "isort", "black" },
    go = { "goimports", "gofmt" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },

    -- Use the "*" filetype to run formatters on all filetypes.
    ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

-- require("conform").setup(options)
return options
