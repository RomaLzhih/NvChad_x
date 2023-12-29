---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "my_nord",
  theme_toggle = { "my_nord", "my_nord" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    -- modules arg here is the default table of modules
    overriden_modules = function(modules)
      -- define the somefunction anywhwere in your custom dir, just call it well!
      -- modules[2] = somefunction()

      -- adding a module between 2 modules
      -- Use the table.insert functin to insert at specific index
      -- This will insert a new module at index 2 and previous index 2 will become 3 now
      table.insert(
        modules,
        9,
        (function()
          local linters = require("lint").get_running()
          if #linters == 0 then
            return " %#St_lspWarning#󰦕  "
          end
          return "%#St_lspWarning#󱉶  " .. table.concat(linters, ", ") .. " "
        end)()
      )
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
