return {
  {
    "saghen/blink.cmp",
    -- enabled = false,
    opts = {
      appearance = {
        -- use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
      },
      completion = {
        -- menu = {
        --   draw = {
        --     columns = {
        --       { "label", "label_description", gap = 1 },
        --       { "kind_icon", "kind" },
        --     },
        --   },
        -- },
        ghost_text = {
          enabled = false,
        },
      },
      documentation = {
        treesitter_highlighting = true,
      },
    },
  },
  -- {
  --   "saghen/blink.cmp",
  --   opts = function(_, opts)
  --     opts.sources.default = { "lsp", "path", "buffer" }
  --     return opts
  --   end,
  -- },
}
