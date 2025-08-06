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
        documentation = {
          treesitter_highlighting = true,
        },
        ghost_text = {
          enabled = false,
        },
        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },
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
