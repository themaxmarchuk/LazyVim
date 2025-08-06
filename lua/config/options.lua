-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local is_win = vim.fn.has("win32") == 1

if is_win then
  -- vim.o.keywordprg = ":help"
  -- vim.o.shell = "cmd.exe /K %CMDER_ROOT%\\vendor\\bin\\vscode_init.cmd"
  vim.o.shell = "nu"
  vim.o.shellcmdflag = "-c"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

if vim.g.neovide then
  -- vim.api.nvim_set_option_value("guifont", "RobotoMono NF:h13.5", {})
  -- vim.api.nvim_set_option_value("guifont", "JetBrainsMono_Nerd_Font:h13.5:#e-subpixelantialias:#h-full:w-0.5", {})
  -- vim.api.nvim_set_option_value("linespace", -3, {})
  -- vim.api.nvim_set_option_value("guifont", "BerkeleyMono_Nerd_Font:h13.5:#e-subpixelantialias:#h-full:w-0.5", {})
  vim.api.nvim_set_option_value("linespace", -1, {})
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_cursor_trail_length = 0.05
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_scroll_animation_length = 0.0
  -- vim.g.neovide_cursor_animation_length = 0.03 -- default is 0.06
  -- vim.g.neovide_cursor_animation_length = 0 -- instant cursor movement
  vim.g.neovide_cursor_animation_length = 0.01

  -- basic railgun setup: railgun from nvimdots github
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  -- vim.g.neovide_cursor_vfx_opacity = 200.0
  -- vim.g.neovide_cursor_vfx_particle_speed = 20.0
  -- vim.g.neovide_cursor_vfx_particle_density = 5.0
  -- vim.g.neovide_cursor_vfx_particle_lifetime = 1.2

  -- neovide particle setup: Snow Pixedust
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_density = 32
  vim.g.neovide_cursor_vfx_particle_lifetime = 5
  vim.g.neovide_cursor_vfx_particle_speed = 20

  -- NEW SECTION
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_blur = false
  -- vim.g.neovide_position_animation_length = 0
  -- vim.g.neovide_text_contrast = 0.1
  -- vim.g.neovide_text_gamma = 0.8

  vim.keymap.set({ "n", "v", "i", "c" }, "<F11>", function()
    if vim.g.neovide_fullscreen == 1 then
      vim.g.neovide_fullscreen = 0
    else
      vim.g.neovide_fullscreen = 1
    end
  end)

  vim.g.neovide_cursor_vfx_particle_density = 0
  -- NEW SECTION

  -- resize with alt + and alt - and reset with alt 0
  vim.keymap.set("n", "<M-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end, { silent = true, desc = "Zoom in (neovide)" })
  vim.keymap.set("n", "<M-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + -0.1
  end, { silent = true, desc = "Zoom out (neovide)" })
  vim.keymap.set("n", "<M-0>", function()
    vim.g.neovide_scale_factor = 1.0
  end, { silent = true, desc = "Reset zoom (neovide)" })
end

vim.o.fileformats = "unix,dos"
vim.o.cursorlineopt = "number"

vim.g.snacks_animate = false
vim.o.guicursor = "n-v-c:block-Cursor/lCursor,i-ci:ver25-Cursor/lCursor"

vim.o.autowrite = false

vim.o.statuscolumn = "%3l %s"

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.list = false
