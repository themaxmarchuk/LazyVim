return {
  -- -- add colorscheme
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        -- compile = false,  -- enable compiling the colorscheme
        -- undercurl = true, -- enable undercurls
        commentStyle = { italic = false },
        -- functionStyle = {},
        keywordStyle = { italic = false },
        -- statementStyle = { bold = true },
        -- typeStyle = {},
        -- transparent = false,   -- do not set background color
        -- dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        -- terminalColors = true, -- define vim.g.terminal_color_{0,17}
        -- colors = {             -- add/modify theme and palette colors
        --   palette = {},
        --   theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        -- },
        overrides = function(colors) -- add/modify highlights
          return {
            ["@variable.builtin"] = { italic = false },
          }
        end,
        -- theme = "wave",  -- Load "wave" theme when 'background' option is not set
        -- background = {   -- map the value of 'background' option to a theme
        --   dark = "wave", -- try "dragon" !
        --   light = "lotus",
        -- },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "kanagawa",
      -- colorscheme = "tokyonight-storm",
      -- colorscheme = "solarized-osaka",
      -- colorscheme = "nordic",
      colorscheme = "terafox",
    },
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
    lazy = true,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
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
    lazy = true,
    config = function()
      vim.g.nord_italic = false
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },
  {
    "themaxmarchuk/grail",
    dir = "C:\\Users\\Max\\dev\\grail",
    lazy = true,
    opts = {
      italics = false,
      disable_italic_comments = true,
    },
  },
  { "hachy/eva01.vim", lazy = true },
}
