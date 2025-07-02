return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
      side = "right"
    },
    filters = {
      dotfiles = false,       -- Mostrar archivos ocultos (.gitignore, .env, etc.)
      git_ignored = false,    -- Mostrar archivos ignorados por Git
    },
    git = {
      enable = true,
      ignore = false,         -- No ignorar archivos Git
    },
  },
}

