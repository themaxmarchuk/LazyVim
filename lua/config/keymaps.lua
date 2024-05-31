-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- vim.o.shell = "cmd.exe /K %CMDER_ROOT%\\vendor\\bin\\vscode_init.cmd"
local is_win = vim.fn.has("win32") == 1

if is_win then
  map("n", "<M-i>", function()
    Util.terminal({
      "cmd.exe",
      "/K",
      "%CMDER_ROOT%\\vendor\\bin\\vscode_init.cmd",
    }, {
      cwd = Util.root(),
    })
  end, { desc = "Terminal (root dir)" })
  map("t", "<M-i>", "<cmd>close<cr>", { desc = "Close terminal" })
  map("n", "<leader>fT", function()
    Util.terminal({
      "cmd.exe",
      "/K",
      "%CMDER_ROOT%\\vendor\\bin\\vscode_init.cmd",
    })
  end, { desc = "Terminal (cwd)" })
end

vim.keymap.del("n", "<leader>cf")
map("n", "<M-f>", function()
  Util.format({ force = true })
end, {
  desc = "Format buffer",
})
