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

    -- NOTE: formatting
    ["<C-f>"] = {
      function()
        -- vim.lsp.buf.format { async = true }
        require("conform").format { async = true, lsp_fallback = true }
      end,
      "LSP formatting",
    },

    -- NOTE: operation
    ["<C-u>"] = { "<C-r>", "Revert undo" },

    -- NOTE: fold
    ["<A-t>"] = {
      "<cmd> set foldmethod=expr <CR> <cmd> set foldexpr=nvim_treesitter#foldexpr() <CR>",
      "Fold code by treesitter",
    },
    ["<A-q>"] = { "zA", "Toggle all folding under cursor" },
    ["<A-e>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- NOTE: search
    ["<leader>f"] = { "<cmd> FzfLua grep <CR>", "fzf Rg search" },
    ["<leader>p"] = { "<cmd> FzfLua files <CR>", "fzf Gitfiles search" },
    ["/"] = { "<Plug>(easymotion-sn)", "easy motion n char search" },

    -- NOTE: lspsaga
    ["gic"] = { "<cmd> Lspsaga incoming_calls <CR>", "lsp saga incoming calls" },
    ["goc"] = { "<cmd> Lspsaga outgoing_calls <CR>", "lsp saga outgoing calls" },
    ["gca"] = { "<cmd> Lspsaga code_action <CR>", "lsp saga code action" },
    ["gpd"] = { "<cmd> Lspsaga peek_definition <CR>", "lsp saga peak definition" },
    ["gpt"] = { "<cmd> Lspsaga peek_type_definition <CR>", "lsp saga peak type definition" },
    ["gfd"] = { "<cmd> Lspsaga finder <CR>", "lsp saga finder" },
    ["gol"] = { "<cmd> Lspsaga outline <CR>", "lsp saga outline" },
    ["grn"] = { "<cmd> Lspsaga rename <CR>", "lsp saga rename" },
    ["gwd"] = { "<cmd> Lspsaga show_workspace_diagnostics <CR>", "lsp saga rename" },
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
