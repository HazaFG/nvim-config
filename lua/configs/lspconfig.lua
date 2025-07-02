require("nvchad.configs.lspconfig").defaults()

-- Requiere lspconfig para registrar servidores manuales
local lspconfig = require("lspconfig")

-- Registro manual del Prisma Language Server
lspconfig.prismals = {
  default_config = {
    cmd = { "prisma-language-server", "--stdio" },
    filetypes = { "prisma" },
    root_dir = lspconfig.util.root_pattern("schema.prisma", ".git"),
    settings = {},
  },
}

local servers = { "html", "cssls", "ts_ls", "prismals"}
vim.lsp.enable(servers)
