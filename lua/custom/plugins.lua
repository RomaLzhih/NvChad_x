local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  -- NOTE: nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "nvimdev/lspsaga.nvim",
        config = function()
          require("lspsaga").setup {}
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- NOTE: mason
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  -- NOTE: tmux.nvim
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup()
    end,
    lazy = false,
  },

  -- NOTE: nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  -- NOTE: nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- NOTE: telescope
  {
    "nvim-telescope/telescope.nvim",
    -- enable = false,
    lazy = true,
  },

  -- NOTE: fzf
  {
    "junegunn/fzf",
    build = "./install --bin",
    lazy = false,
  },

  -- NOTE: dressing
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
    end,
    lazy = true,
  },

  -- NOTE: neoscroll.nvim
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {}
    end,
    lazy = false,
  },

  -- NOTE: alpha-nvim
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
    lazy = false,
  },

  -- NOTE: mini.cursorword
  {
    "echasnovski/mini.cursorword",
    version = "*",
    config = function()
      require("mini.cursorword").setup()
    end,
    lazy = false,
  },

  -- NOTE: vim-easymotion
  {
    "easymotion/vim-easymotion",
    lazy = false,
  },

  -- NOTE: vim-visual-multi
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  -- NOTE: tabout.nvim
  {
    "abecodes/tabout.nvim",
    config = function()
      require("tabout").setup()
    end,
    lazy = false,
  },

  -- NOTE: fzf-lua
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup {}
    end,
    lazy = false,
  },

  -- NOTE: playground
  {
    "nvim-treesitter/playground",
    config = function()
      require("nvim-treesitter.configs").setup {}
    end,
  },

  -- NOTE: todo-comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = false,
  },

  -- NOTE: nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    event = "BufReadPost",
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },

    init = function()
      vim.keymap.set("n", "zR", function()
        require("ufo").openAllFolds()
      end)
      vim.keymap.set("n", "zM", function()
        require("ufo").closeAllFolds()
      end)
    end,
  },

  -- NOTE: conform
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "black" },
          -- cpp = { "clang-format" },
          bash = { "beautysh" },
          -- r = { "styler" },
          -- rmd = { "styler" },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
        },
      }
    end,
    lazy = false,
  },

  -- NOTE: Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = {
            enabled = false,
          },
          hover = {
            enabled = false,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          -- command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },

  -- NOTE: Nvim-lint
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        python = { "pylint" },
        cpp = { "clangtidy", "cppcheck" },
        bash = { "shellcheck" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- NOTE: nvim-bqf
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  -- NOTE: hop
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      require("hop").setup {}
    end,
    init = function()
      local hop = require "hop"
      local directions = require("hop.hint").HintDirection
      vim.keymap.set("", "f", function()
        hop.hint_char2 { direction = directions.AFTER_CURSOR }
      end, { remap = true })
      vim.keymap.set("", "F", function()
        hop.hint_char2 { direction = directions.BEFORE_CURSOR }
      end, { remap = true })
      vim.keymap.set("", "t", function()
        hop.hint_char2 { direction = directions.AFTER_CURSOR, hint_offset = -1 }
      end, { remap = true })
      vim.keymap.set("", "T", function()
        hop.hint_char2 { direction = directions.BEFORE_CURSOR, hint_offset = 1 }
      end, { remap = true })
    end,
    lazy = false,
  },

  -- NOTE: Nvim-R
  {
    "jalvesaq/Nvim-R",
    config = function()
      R_assign = false
    end,
    lazy = false,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
