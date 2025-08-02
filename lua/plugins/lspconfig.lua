local lspconfig = require("lspconfig")

local is_win = vim.fn.has("win32") == 1

return {
  "neovim/nvim-lspconfig",
  opts = {
    doucment_highlight = {
      enabled = false,
    },
    servers = {
      gdscript = {},
      rust_analyzer = {},
      ols = { mason = false },
    },
    setup = {
      gdscript = function(_, opts)
        opts.root_dir = lspconfig.util.root_pattern("project.godot")

        if is_win then
          opts.cmd = {
            "ncat",
            "localhost",
            "6005",
          }
        end

        opts.cmd = {
          "gdfast",
        }
      end,
    },
  },
}
