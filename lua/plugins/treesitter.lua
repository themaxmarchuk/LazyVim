return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ignore_install = { "help" }

      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          -- defaults
          "vim",
          "lua",

          -- webdev
          "html",
          "css",
          "javascript",
          "typescript",

          -- systems
          "odin",
          "rust",
          "c",
          "cpp",
          "go",

          -- gamedev
          "godot_resource",
          "gdscript",

          -- config
          "json",
          "yaml",
          "toml",
        })
      end
    end,
  },
}
