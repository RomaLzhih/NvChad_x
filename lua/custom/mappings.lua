---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>fm"] = "",
    ["<C-c>"] = "",
    ["<A-h>"] = "",
    ["<C-h>"] = { "" },
    ["<C-l>"] = { "" },
    ["<C-j>"] = { "" },
    ["<C-k>"] = { "" },
  },
}

M.general = {
  n = {
    ["<C-a>"] = { "ggVG <CR>", "Select all" },
    -- ["<C-f>"] = { "mtgg=G\'t", "format file"},
    ["<C-f>"] = {
      function()
        -- vim.lsp.buf.format { async = true }
        require("conform").format { async = true, lsp_fallback = true }
      end,
      "LSP formatting",
    },
    ["<C-u>"] = { "<C-r>", "Revert undo" },
    ["<A-t>"] = {
      "<cmd> set foldmethod=expr <CR> <cmd> set foldexpr=nvim_treesitter#foldexpr() <CR>",
      "Fold code by treesitter",
    },
    ["<A-q>"] = { "zA", "Toggle all folding under cursor" },

    -- ["<A-a>"] = { "<A-t>za", "Toggle one folding under cursor " },
    ["<A-e>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>f"] = { "<cmd> FzfLua grep <CR>", "fzf Rg search" },
    ["<leader>p"] = { "<cmd> FzfLua files <CR>", "fzf Git-files search" },
    ["/"] = { "<Plug>(easymotion-sn)", "easy motion n char search" },
  },

  i = {
    ["<C-f>"] = { "<ESC><C-f>", "exit to normal and format" },
  },

  v = {
    ["<C-y>"] = { '"+y', "Copy to clipboard" },
    ["<C-p>"] = { '"+p', "Copy from clipboard" },
    ["<leader>f"] = { "<cmd> FzfLua grep_visual <CR>", "fzf Rg search" },
  },
}

-- more keybinds!

return M
