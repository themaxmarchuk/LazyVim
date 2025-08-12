return {
  -- -- add colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "evergarden",
    },
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      local dragon = require("kanagawa.colors").setup({ theme = "dragon" })
      require("kanagawa").setup({
        compile = true,
        -- compile = false,  -- enable compiling the colorscheme
        -- undercurl = true, -- enable undercurls
        commentStyle = { italic = false },
        -- functionStyle = {},
        keywordStyle = { italic = false },
        -- statementStyle = { bold = true },
        -- typeStyle = {},
        -- transparent = false, -- do not set background color
        -- dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        -- terminalColors = true, -- define vim.g.terminal_color_{0,17}
        -- colors = {             -- add/modify theme and palette colors
        --   palette = {},
        --   theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        -- },

        --- @diagnostic disable-next-line
        overrides = function(colors) -- add/modify highlights
          return {
            ["@variable.builtin"] = { italic = false },
            ["@lsp.typemod.function.readonly"] = { bold = false },
            ["@lsp.typemod.method.readonly.cpp"] = { link = "Function" },
            -- ["@lsp.typemod.variable.readonly.cpp"] = { link = "@variable" },
            ["@lsp.typemod.variable.functionScope.cpp"] = { link = "@variable" },
            ["@lsp.typemod.type.deduced.cpp"] = { link = "Special" },
            ["@lsp.typemod.class.deduced.cpp"] = { link = "Special" },
            ["@lsp.typemod.enum.deduced.cpp"] = { link = "Special" },
          }
        end,
        -- theme = "wave",  -- Load "wave" theme when 'background' option is not set
        -- background = {   -- map the value of 'background' option to a theme
        --   dark = "wave", -- try "dragon" !
        --   light = "lotus",
        -- },
        colors = {
          theme = {
            dragon = {
              ui = {
                bg = dragon.palette.dragonBlack0,
              },
            },
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "craftzdog/solarized-osaka.nvim",
    config = function()
      require("solarized-osaka").setup({
        transparent = false,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
        on_colors = function(colors) end,
        on_highlights = function(highlights, colors) end,
      })
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    config = function()
      require("nordic").setup({
        italic_comments = false,
      })
    end,
  },
  {
    "andersevenrud/nordic.nvim",
    config = function()
      vim.g.nord_italic = false
    end,
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "themaxmarchuk/grail",
    dir = "C:\\Users\\Max\\dev\\grail",
    opts = {
      italics = false,
      disable_italic_comments = true,
    },
  },
  { "hachy/eva01.vim" },
  {
    "slugbyte/lackluster.nvim",
  },
  {
    "rjshkhr/shadow.nvim",
  },
  {
    "ferdinandrau/carbide.nvim",
  },
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_disable_italic_comment = 1
    end,
  },
  {
    "everviolet/nvim",
    name = "evergarden",
    opts = {
      theme = {
        variant = "spring",
      },
      style = {
        search = {},
        types = {},
        keyword = {},
        comment = {},
      },
    },
  },
  {
    "ribru17/bamboo.nvim",
    opts = {
      code_style = {
        comments = { italic = false },
        conditionals = { italic = false },
        namespaces = { italic = false },
        parameters = { italic = false },
      },
      highlights = {
        ["@keyword.modifier"] = { link = "Keyword" },
      },
    },
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = false,
      gamma = 1.00,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        identifiers = { italic = false },
        functions = {},
        variables = {},
      },
      custom_highlights = {} or function(highlights, palette)
        return {}
      end,
      custom_palette = {} or function(palette)
        return {}
      end,
      terminal_colors = true,
    },
  },
  {
    "nickkadutskyi/jb.nvim",
    config = function()
      require("jb").setup({
        disable_hl_args = {
          italic = true,
        },
      })
    end,
  },
}
