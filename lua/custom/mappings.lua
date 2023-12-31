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
    ["<A-Up>"] = { "ddkP", "Move line up" },
    ["<A-Down>"] = { "ddp", "Move line below" },
    ["<A-e>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>pl"] = { "<cmd> set spell! <CR>", "Toggle spell check" },

    -- NOTE: Nvterm
    ["<A-x>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    -- NOTE: formatting
    ["<C-f>"] = {
      function()
        -- vim.lsp.buf.format { async = true }
        require("conform").format { async = true, lsp_fallback = true }
      end,
      "conform formatting",
    },

    -- NOTE: operation
    ["<C-u>"] = { "<C-r>", "Revert undo" },

    -- NOTE: fold
    ["<A-q>"] = { "zA", "Toggle all folding under cursor" },

    -- NOTE: search
    ["/"] = { "<Plug>(easymotion-sn)", "easy motion n char search" },

    -- NOTE: lspsaga
    ["<leader>ic"] = { "<cmd> Lspsaga incoming_calls <CR>", "lsp saga incoming calls" },
    ["<leader>oc"] = { "<cmd> Lspsaga outgoing_calls <CR>", "lsp saga outgoing calls" },
    ["<leader>ca"] = { "<cmd> Lspsaga code_action <CR>", "lsp saga code action" },
    ["<leader>pd"] = { "<cmd> Lspsaga peek_definition <CR>", "lsp saga peak definition" },
    ["<leader>pt"] = { "<cmd> Lspsaga peek_type_definition <CR>", "lsp saga peak type definition" },
    ["<leader>fd"] = { "<cmd> Lspsaga finder <CR>", "lsp saga finder" },
    ["<leader>ol"] = { "<cmd> Lspsaga outline <CR>", "lsp saga outline" },
    ["<leader>rn"] = { "<cmd> Lspsaga rename <CR>", "lsp saga rename" },
    ["<leader>wd"] = { "<cmd> Lspsaga show_workspace_diagnostics <CR>", "lsp saga rename" },
  },

  i = {
    ["<C-f>"] = { "<ESC><C-f>", "exit to normal and format" },
  },

  v = {
    ["<C-y>"] = { '"+y', "Copy to clipboard" },
    ["<C-p>"] = { '"+p', "Copy from clipboard" },
  },

  t = {
    ["<ESC>"] = { vim.api.nvim_replace_termcodes("<c-\\><c-n>", true, true, true), "escape terminal mode" },
  },
}

-- more keybinds!

return M
