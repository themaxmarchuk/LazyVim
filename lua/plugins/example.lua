return {
  {
    "folke/flash.nvim",
    enabled = false,
  },
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
    ---@type snacks.Config
    opts = {
      -- statuscolumn = { enabled = false },
      scope = { enabled = false },
      indent = { enabled = false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
