-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  CursorLine = {
    bg = "one_bg",
  },
  ["@function"] = { italic = true },
  ["@function.call"] = { italic = true },
  ["@keyword"] = { italic = true },
  ["@keyword.return"] = { italic = true },
  ["@string"] = { italic = true },
  ["@storageclass"] = { italic = true },
  ["@type"] = { italic = true },
  ["@type.qualifier"] = { italic = true },
  ["@type.builtin"] = { italic = true },
  ["@type.identifier"] = { italic = true },
  ["@repeat"] = { italic = true },
  ["@conditional"] = { italic = true },
  ["@parameter"] = { italic = true },
  -- ["@property"] = { italic = true },
  ["@variable.builtin"] = { italic = true },
  Repeat = { italic = true },
  Type = { italic = true },
  Comment = { italic = true },
  Conditional = { italic = true },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  String = { italic = true },
}

M.changed_themes = {
  node = {
    base_16 = {
      base00 = "#2E3440", -- nord0 in palette
      base01 = "#3B4252", -- nord1 in palette
      base02 = "#434C5E", -- nord2 in palette
      base03 = "#4C566A", -- nord3 in palette
      base04 = "#D8DEE9", -- nord4 in palette
      base05 = "#E5E9F0", -- nord5 in palette
      base06 = "#ECEFF4", -- nord6 in palette
      base07 = "#8FBCBB", -- nord7 in palette
      base08 = "#88C0D0", -- nord8 in palette
      base09 = "#81A1C1", -- nord9 in palette
      base0A = "#5E81AC", -- nord10 in palette
      base0B = "#BF616A", -- nord11 in palette
      base0C = "#D08770", -- nord12 in palette
      base0D = "#EBCB8B", -- nord13 in palette
      base0E = "#A3BE8C", -- nord14 in palette
      base0F = "#B48EAD", -- nord15 in palette
    },
  },
}

return M
