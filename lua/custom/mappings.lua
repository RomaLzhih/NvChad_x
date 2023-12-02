---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>fm"] = "",
    ["<C-c>"] = "",
  },
}

M.general = {
  n = {
    ["<C-a>"] = { "ggVG <CR>", "Select all" },
    ["<C-y>"] = { "\"+y <CR>", "Copy to clipboard" },
    ["<C-p>"] = { "\"+p <CR>", "Copy from clipboard" },
    -- ["<C-f>"] = { "mtgg=G\'t", "format file"},
    ["<C-f>"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    ["<A-q>"] = { "zA", "Toggle folding under cursor"},

    ["<C-u>"] = { "<C-r>", "Revert undo"},
    ["<A-t>"] = {"<cmd> set foldmethod=expr <CR> <cmd> set foldexpr=nvim_treesitter#foldexpr() <CR>", "Fold code by treesitter"},
    ["<A-e>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>f"] = { "<cmd> FzfLua grep <CR>", "fzf Rg search" },
    ["<leader>p"] = { "<cmd> FzfLua files <CR>", "fzf Git-files search" },
    ["/"] = { "<Plug>(easymotion-sn)", "easy motion n char search" },
  },
  i = {
    ["<C-S-O>"] = { "<ESC>-O", "insert previous line" },
    ["<C-o>"] = { "<ESC>-o", "insert next line" },
    ["<C-f>"] = { "<ESC>-<C-f>", "exit to normal and format" },
  },
  v = {
    ["<leader>f"] = { "<cmd> FzfLua grep_visual <CR>", "fzf Rg search" },
  },
}

-- more keybinds!

return M
