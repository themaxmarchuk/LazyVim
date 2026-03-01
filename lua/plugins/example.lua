local time_format = (vim.fn.has("win32") == 1 and "%#I" or "%-I") .. ":%M %p"

return {
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {},
    ft = "markdown",
  },
  {
    "shortcuts/no-neck-pain.nvim",
    opts = {
      width = 120,
    },
    cmd = {
      "NoNeckPain",
      "NoNeckPainResize",
      "NoNeckPainToggleLeftSide",
      "NoNeckPainToggleRightSide",
      "NoNeckPainWidthUp",
      "NoNeckPainWidthDown",
      "NoNeckPainScratchPad",
    },
  },
  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = {
  --     linters_by_ft = {
  --       typescriptreact = { "oxlint" },
  --     },
  --   },
  -- },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescriptreact = { "oxfmt" },
        -- typescript = { "oxfmt" },
        -- odin = { "odinfmt" },
      },
    },
  },
  {
    "folke/noice.nvim",
    -- enabled = false,
    ---@module "noice"
    ---@type NoiceConfig
    opts = {
      cmdline = {
        view = "cmdline",
      },
    },
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   enabled = false,
  -- },
  {
    "folke/todo-comments.nvim",
    opts = {
      gui_style = {
        fg = "BOLD",
      },
      highlight = {
        after = "",
        keyword = "fg",
      },
    },
  },
  {
    "folke/snacks.nvim",
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      -- statuscolumn = {
      --   enabled = true,
      --   left = {},
      --   right = { "sign", "git" },
      -- },
      scope = { enabled = false },
      indent = { enabled = false },
      words = { enabled = false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {
          function()
            return " " .. os.date(time_format)
          end,
        },
      },
    },
  },
}
