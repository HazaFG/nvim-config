require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })


map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
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

-- Crear nuevo archivo y abrir en nvim-tree (con verificación)
map("n", "<leader>fn", function()
  vim.ui.input({ prompt = "Ruta del archivo nuevo (ej. src/components/Form.tsx): " }, function(input)
    if input and input ~= "" then
      local filepath = vim.fn.expand(input)
      local dir = vim.fn.fnamemodify(filepath, ":h")

      -- Verificar si el archivo ya existe
      if vim.fn.filereadable(filepath) == 1 then
        vim.ui.select({ "Sí", "No" }, { prompt = "El archivo ya existe. ¿Sobrescribir?" }, function(choice)
          if choice == "Sí" then
            vim.cmd("silent !mkdir -p " .. dir)
            vim.cmd("e! " .. filepath) -- Forzar abrir el archivo existente
            vim.cmd("NvimTreeOpen")
            require("nvim-tree.api").tree.find_file({ path = filepath, focus = true })
          end
        end)
      else
        vim.cmd("silent !mkdir -p " .. dir)
        vim.cmd("e " .. filepath)
        vim.cmd("NvimTreeOpen")
        require("nvim-tree.api").tree.find_file({ path = filepath, focus = true })
      end
    end
  end)
end, { desc = "Crear nuevo archivo (con confirmación)" })


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

-- Comentar la línea actual
map('n', '<C-/>', 'I--<Esc>', { desc = 'Comentar línea actual' })
-- Comentar las líneas seleccionadas en modo visual
map('v', '<C-/>', ':s/^/--/<CR>', { desc = 'Comentar líneas seleccionadas' })


