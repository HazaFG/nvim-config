return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      
            dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║██║   ██║██║██║╚██╔╝██║  ",
  "  ██║ ╚████║███████╗╚██████╔╝╚██████╔╝██║██║ ╚═╝ ██║  ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝     ╚═╝  ",
  "          🦁 🎹 WELCOME BACK: HazaelFG 🎹 🦁          ",
}


      alpha.setup(dashboard.opts)

      -- Sobrescribe el highlight "Type" para el header de Alpha
      vim.api.nvim_set_hl(0, "Type", { fg = "#fcc96a", bg = "none" }) -- Ejemplo con color naranja de Gruvbo
      --vim.api.nvim_set_hl(0, "Normal", { fg = "#ff6c5c", bg = "none" }) -- Ejemplo con un color claro de Gruvbox para el texto normal

      -- Disable folding on alpha buffer, agrego esto para ver si mi repam funciona, wow, si jalo
      --vim.cmd([[
        --autocmd FileType alpha setlocal nofoldenable
      --]])
    end,
  },
}
