return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  "tpope/vim-commentary",

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "svelte",
      "xml"
    },
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript", "tsx", "jsx"
      },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("configs.luasnip")
    end,
  },
}

