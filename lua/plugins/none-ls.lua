return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    -- local lint = null_ls.builtins.diagnostics

    local sources = {
      formatting.stylua,
      -- formatting.rustfmt,
      -- formatting.prettier,
      formatting.gdformat,
      formatting.goimports,
      -- formatting.gofmt,

      -- lint.gdlint,
    }

    -- for _, source in ipairs(sources) do
    --   table.insert(opts.sources, source)
    -- end
    null_ls.setup({ sources = sources })
  end,
}
