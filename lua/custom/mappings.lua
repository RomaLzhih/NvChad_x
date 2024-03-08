---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>fm"] = "",
    ["<C-c>"] = "",
    ["<A-h>"] = "",
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
    -- ["<C-f>"] = {
    --   function()
    --     -- vim.lsp.buf.format { async = true }
    --     require("conform").format { async = true, lsp_fallback = true }
    --   end,
    --   "conform formatting",
    -- },

    -- NOTE: linting
    ["<leader>tl"] = {
      function()
        require("lint").linters_by_ft.cpp = { "clang-tidy", "cpplint", "cppcheck" }
        require("lint").try_lint()
      end,
      "Linting",
    },

    ["<leader>ul"] = {
      function()
        require("lint").linters_by_ft.cpp = {}
        require("lint").try_lint()
      end,
      "Linting all",
    },

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

    -- NOTE: Neorg
    ["<leader>id"] = { "<cmd> Neorg index <CR>", "Neorg open index" },
    ["<leader>rt"] = { "<cmd> Neorg return <CR>", "Neorg return to work" },

    -- NOTE: telescope load custom colorscheme
    ["<leader>cs"] = { "<cmd> Telescope colorscheme <CR>", "Telescope colorscheme" },

    -- NOTE: center buffer (zen mode)
    ["<leader>cm"] = { "<cmd> NoNeckPain <CR>", "center buffer" },
    ["<leader>ci"] = { "<cmd> NoNeckPainWidthUp <CR>", "Increase center margin" },
    ["<leader>cd"] = { "<cmd> NoNeckPainWidthDown <CR>", "Decrease center margin" },
  },

  t = {
    ["<ESC>"] = { vim.api.nvim_replace_termcodes("<c-\\><c-n>", true, true, true), "escape terminal mode" },
  },
}

-- more keybinds!

return M
