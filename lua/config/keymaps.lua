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

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv", { desc = "Next Search Result" })
map("n", "N", "Nzzzv", { desc = "Prev Search Result" })

vim.keymap.del("n", "<S-H>")
vim.keymap.del("n", "<S-L>")

vim.keymap.del("n", "<M-j>")
vim.keymap.del("n", "<M-k>")

-- vim.o.shell = "cmd.exe /K %CMDER_ROOT%\\vendor\\bin\\vscode_init.cmd"
local is_win = vim.fn.has("win32") == 1

GlobalTerminal = nil --- @type snacks.win

--- @param cmd string
function GTermExecute(cmd)
  if GlobalTerminal ~= nil and vim.fn.bufexists(GlobalTerminal.buf) == 1 then
    vim.fn.chansend(vim.bo[GlobalTerminal.buf].channel, cmd .. "\r\n")
  else
    --- @diagnostic disable-next-line
    GlobalTerminal = nil
  end
end

map("n", "<M-i>", function()
  GlobalTerminal = Snacks.terminal({
    "nu",
    -- "cmd.exe",
    -- "/K",
    -- "%CMDER_ROOT%\\vendor\\bin\\vscode_init.cmd",
  }, {
    cwd = Util.root(),
  })
end, { desc = "Terminal (root dir)" })
map("t", "<M-i>", "<cmd>close<cr>", { desc = "Close terminal" })
map("n", "<leader>fT", function()
  Snacks.terminal({
    "nu",
    -- "cmd.exe",
    -- "/K",
    -- "%CMDER_ROOT%\\vendor\\bin\\vscode_init.cmd",
  })
end, { desc = "Terminal (cwd)" })

vim.keymap.del("n", "<leader>cf")
map("n", "<M-f>", function()
  Util.format({ force = true })
end, {
  desc = "Format buffer",
})

local function get_nvim_colorschemes()
  local builtin_colorschemes = {
    "blue",
    "darkblue",
    "default",
    "delek",
    "desert",
    "elflord",
    "evening",
    "habamax",
    "industry",
    "koehler",
    "lunaperche",
    "morning",
    "murphy",
    "pablo",
    "peachpuff",
    "quiet",
    "retrobox",
    "ron",
    "shine",
    "slate",
    "sorbet",
    "torte",
    "unokai",
    "vim",
    "wildcharm",
    "zaibatsu",
    "zellner",
  }

  local items = {} ---@type snacks.picker.finder.Item[]
  local rtp = vim.o.runtimepath

  if package.loaded.lazy then
    rtp = rtp .. "," .. table.concat(require("lazy.core.util").get_unloaded_rtp(""), ",")
  end

  local files = vim.fn.globpath(rtp, "colors/*", false, true) ---@type string[]

  items[1] = {
    text = vim.g.colors_name,
    file = "none",
  }

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    local ext = vim.fn.fnamemodify(file, ":e")

    if vim.tbl_contains(builtin_colorschemes, name) then
      goto continue
    end

    if (ext == "vim" or ext == "lua") and name ~= vim.g.colors_name then
      items[#items + 1] = {
        text = name,
        file = file,
      }
    end

    ::continue::
  end
  return items
end

vim.keymap.del("n", "<leader>ft")
map("n", "<leader>ft", function()
  Snacks.picker.colorschemes({
    finder = get_nvim_colorschemes,
    format = "text",
    preview = "none",
    matcher = {
      sort_empty = true,
    },
    sort = function(a, b)
      if a.file == "none" then
        return true
      end

      if b.file == "none" then
        return false
      end

      return a.text < b.text
    end,
    layout = {
      preset = "right",
      layout = {
        height = 0.5,
        width = 0.2,
        min_width = 0,
        anchor = "NE",
        row = 0.5 - 0.25,
        resize = true,
        col = function()
          return vim.o.columns
        end,
        position = "float",
      },
      hidden = { "preview" },
    },
    on_show = function(picker)
      picker.preview.state.colorscheme = vim.g.colors_name
    end,
    on_change = function(picker, item)
      if item then
        vim.schedule(function()
          vim.cmd("hi clear")
          vim.cmd("colorscheme " .. item.text)
        end)
      end
    end,
    confirm = function(picker, item)
      picker.preview.state.did_pick = true
      picker:close()
      -- if item then
      --   vim.schedule(function()
      --     vim.cmd("colorscheme " .. item.text)
      --   end)
      -- end
    end,
    on_close = function(picker)
      if not picker.preview.state.did_pick then
        vim.cmd("hi clear")
        vim.cmd("colorscheme " .. picker.preview.state.colorscheme)
      end
    end,
  })
end, {
  desc = "Find colorschemes (themes)",
})
