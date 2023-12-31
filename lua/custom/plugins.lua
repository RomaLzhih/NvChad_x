local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

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

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
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
    "declancm/cinnamon.nvim",
    config = function()
      require("cinnamon").setup {
        extra_keymaps = true,
        override_keymaps = true,
        max_length = 500,
        -- scroll_limit = -1,
      }
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
          cpp = { "clang-format" },
          bash = { "beautysh" },
          shell = { "shfmt" },
          sh = { "shfmt" },
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
      -- "rcarriga/nvim-notify",
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
        -- python = { "pylint" },
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
      -- place this in one of your configuration file(s)
      local hop = require "hop"
      local directions = require("hop.hint").HintDirection
      vim.keymap.set("", "f", function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR }
      end, { remap = true })
      vim.keymap.set("", "F", function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR }
      end, { remap = true })
      vim.keymap.set("", "t", function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR, hint_offset = -1 }
      end, { remap = true })
      vim.keymap.set("", "T", function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, hint_offset = 1 }
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

  -- NOTE: vim latex
  {
    "lervag/vimtex",
    init = function()
      -- vim.g.vimtex_view_general_viewer = "sioyek"
      -- vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_quickfix_open_on_warning = 0
      -- vim.cmd "let g:vimtex_compiler_latexmk = {'continuous':'0'}"
      vim.g.tex_use_latexmk = 0
      vim.api.nvim_exec(
        [[
        let s:pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode ' .
              \ '-halt-on-error -synctex=1 -output-directory=%:h %'
        let s:latexmk = 'latexmk -pdf -output-directory=%:h %'
        
        function! s:TexToggleLatexmk() abort
          if g:tex_use_latexmk  
            let g:tex_use_latexmk = 0
          else  
            let g:tex_use_latexmk = 1
          endif
          call s:TexSetMakePrg()  
        endfunction
        
        function! s:TexSetMakePrg() abort
          if g:tex_use_latexmk
            let &l:makeprg = expand(s:latexmk)
          else
            let &l:makeprg = expand(s:pdflatex)
          endif
        endfunction
        
        nmap <localleader>tl <Plug>TexToggleLatexmk
        nnoremap <script> <Plug>TexToggleLatexmk <SID>TexToggleLatexmk
        nnoremap <SID>TexToggleLatexmk :call <SID>TexToggleLatexmk()<CR>
        ]],
        false
      )
      -- vim.g.vimtex_compiler_method = "pdflatex"
    end,
    lazy = false,
  },

  -- NOTE: surrounds
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  --NOTE: search wigh google
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {},
    keys = {
      {
        mode = { "n" },
        "gW",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },

  -- NOTE: mark
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup {}
    end,
    lazy = false,
  },

  -- NOTE: rainbow_csv
  {
    "mechatroner/rainbow_csv",
    lazy = false,
  },

  -- NOTE: better_escape
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
    lazy = false,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
    lazy = true,
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
    lazy = false,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
