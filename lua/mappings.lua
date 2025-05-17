require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })


map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find Files" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find Files" })

map({ 'v', 'n' }, '<C-c>', '"+y', { desc = 'Copy to clipboard' })
map({ 'i', 'n', 'v' }, '<C-v>', '<C-r>+', { desc = 'Paste from clipboard' })

-- Crear nueva carpeta y abrir en nvim-tree
map("n", "<leader>cn", function()
  vim.ui.input({ prompt = "Ruta de la carpeta nueva (ej. src/components): " }, function(input)
    if input then
      vim.cmd("silent !mkdir -p " .. input)
      print("📁 Carpeta creada: " .. input)
      vim.cmd("NvimTreeOpen")
      require("nvim-tree.api").tree.find_file({ path = input, focus = true })
    end
  end)
end, { desc = "Crear nueva carpeta" })

map("n", "<leader>fn", function()
  vim.ui.input({ prompt = "Ruta del archivo nuevo (ej. src/components/Form.tsx): " }, function(input)
    if input then
      vim.cmd("silent !mkdir -p " .. vim.fn.fnamemodify(input, ":h"))
      vim.cmd("e " .. input)
      vim.cmd("NvimTreeOpen")
      require("nvim-tree.api").tree.find_file({ path = input, focus = true })
    end
  end)
end, { desc = "Crear nuevo archivo" })


-- Borrar una carpeta
map("n", "<leader>dc", function()
  vim.ui.input({ prompt = "Ruta de la carpeta a borrar: " }, function(input)
    if input then
      vim.cmd("silent !rm -r " .. input)
      print("🗑️ Carpeta eliminada: " .. input)
      vim.cmd("NvimTreeRefresh")  -- Actualiza nvim-tree para reflejar los cambios
    end
  end)
end, { desc = "Borrar carpeta" })


-- Borrar un archivo
map("n", "<leader>df", function()
  vim.ui.input({ prompt = "Ruta del archivo a borrar: " }, function(input)
    if input then
      vim.cmd("silent !rm " .. input)
      print("🗑️ Archivo eliminado: " .. input)
      vim.cmd("NvimTreeRefresh")
    end
  end)
end, { desc = "Borrar archivo por ruta" })


-- Borrar el archivo del buffer actual
map("n", "<leader>dx", function()
  local file = vim.fn.expand("%:p")
  if vim.fn.confirm("¿Eliminar archivo actual?\n" .. file, "&Sí\n&No", 1) == 1 then
    vim.cmd("silent !rm " .. file)
    vim.cmd("bd!")  -- Cierra el buffer
    print("🗑️ Archivo eliminado: " .. file)
    vim.cmd("NvimTreeRefresh")
  end
end, { desc = "Borrar archivo actual" })


-- Comentar la línea actual
map('n', '<C-/>', 'I--<Esc>', { desc = 'Comentar línea actual' })
-- Comentar las líneas seleccionadas en modo visual
map('v', '<C-/>', ':s/^/--/<CR>', { desc = 'Comentar líneas seleccionadas' })


