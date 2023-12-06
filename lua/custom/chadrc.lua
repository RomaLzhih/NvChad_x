---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "nord",
  theme_toggle = { "nord", "catppuccin", "github_dark", "monekai", "onenord", "palenight" },
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
