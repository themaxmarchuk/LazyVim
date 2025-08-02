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
        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },
      },
      documentation = {
        treesitter_highlighting = true,
      },
    },
  },
}
