local single_file = true
if single_file == true then
  require("java_single_file")
  return
end

local sys_settings = require("sys_settings")

local function terminalIsListed()
  local tabs = vim.fn.gettabinfo()
  local active_tab_nr = vim.api.nvim_tabpage_get_number(0)
  local active_tab = nil
  --print(vim.inspect(buffers))
  for i, x in ipairs(tabs) do
    if x.tabnr == active_tab_nr then
      active_tab = x
    end
  end

  for i, x in ipairs(active_tab.windows) do
    if vim.fn.getwininfo(x)[1].terminal == 1 then return x end
  end
  return nil
end





-- >>>>> Trova la root directory del progetto, ossia la parent directory di src
local function getRoot()
  local rv = vim.fs.find("src", { upward = true, type = "directory", path = vim.fn.getcwd() })
  if #rv == 0 then return "Unresolved" end
  return vim.fs.dirname(rv[1])
end

local root = getRoot()
if root == "Unresolved" then
  vim.api.nvim_echo({ { "Cannot resolve root dir. Be sure to have a \"src\" folder in you project", "DiffText" } }, false,
    {})
  return
end
vim.api.nvim_buf_set_var(0, "rootDir", root)
-- <<<<< Trova la root directory del progetto, ossia la parent directory di src


-- >>>>> Trova il file contenente la funzione main. Assume che questo sia un un file chiamato Main.java


local function getMainFile()
  local rv = nil

  local paths = vim.fs.find(".paths", { type = "file", path = vim.api.nvim_buf_get_var(0, "rootDir") })[1]
  P(paths)
  if paths ~= nil then
    if pcall(io.lines, paths) then
      for line in io.lines(paths) do
        if line:match("%s*mainfile%s*=%s*\"(.*)\"%s*") ~= nil then
          rv = line:match("%s*mainfile%s*=%s*\"(.*)\"%s*")
          break
        end
      end
    end
  end

  if rv ~= nil then return rv end

  local default_main = vim.fs.find("Main.java", { type = "file", path = vim.api.nvim_buf_get_var(0, "rootDir") })
  if #default_main == 0 then return "Unresolved" end
  return default_main[1]
end

local mainFile = getMainFile()
if mainFile == "Unresolved" then
  vim.api.nvim_echo({ { "Cannot resolve root dir. Be sure to have a \"src\" folder in you project", "DiffText" } }, false,
    {})
  return
end
vim.api.nvim_buf_set_var(0, "mainFile", mainFile)
-- <<<<< Trova il file contenente la funzione main. Assume che questo sia un un file chiamato Main.java


-- >>>>> Ritorna una table contenente il nome di ogni cartella contenuta in progetto/lib
local function get_used_libs()
  local rv = {}
  if (#vim.fs.find("lib", { path = vim.api.nvim_buf_get_var(0, "rootDir"), type = "directory" }) ~= 0) then
    for name, type in vim.fs.dir(vim.api.nvim_buf_get_var(0, "rootDir") .. "/lib") do
      if type == "directory" then
        table.insert(rv, name)
      end
    end
  end
  return rv
end
-- <<<<< Ritorna una table contenente il nome di ogni cartella contenuta in progetto/lib

vim.api.nvim_buf_set_var(0, "usedLibs", get_used_libs())

local function get_used_libs_jar_files()
  if (#vim.fs.find("lib", { path = vim.api.nvim_buf_get_var(0, "rootDir"), type = "directory" }) ~= 0) then
    return vim.fs.find(function(name, _)
        return name:match('.*%.jar$') ~= nil
      end,
      { limit = math.huge, type = 'file', path = vim.api.nvim_buf_get_var(0, "rootDir") .. "/lib" })
  end
  return {}
end

-- >>>>> Comando per compilare
local function runInActiveTerminal()
  vim.cmd("wa")
  local curr_window = vim.api.nvim_get_current_win()
  local terminal_window = terminalIsListed()
  local rootDir = vim.api.nvim_buf_get_var(0, "rootDir")
  local compilationPath = vim.api.nvim_buf_get_var(0, "mainFile"):match("/src/(.*).java")

  -->>>>>>creo comando per compilazione
  local libraries = ""
  if #vim.api.nvim_buf_get_var(0, "usedLibs") > 0 then
    libraries = "--module-path "
    for _, lib in ipairs(vim.api.nvim_buf_get_var(0, "usedLibs")) do
      libraries = libraries .. "\"../lib/" .. lib .. "\":"
    end
    libraries = libraries:sub(1, -2)
    libraries = libraries .. " --add-modules=ALL-MODULE-PATH "
  end

  local command = "cd \"" .. rootDir .. [[/src" && javac -d ../bin ]]

  if #vim.api.nvim_buf_get_var(0, "usedLibs") > 0 then command = command .. libraries end

  command = command .. compilationPath .. [[.java && cd ../bin && java ]]

  if #vim.api.nvim_buf_get_var(0, "usedLibs") > 0 then command = command .. libraries end

  command = command .. compilationPath:gsub("/", ".") .. "\n"
  --<<<<<<creo comando per compilazione

  if (terminal_window ~= nil) then
    --vado alla finestra del terminale
    vim.api.nvim_call_function("win_gotoid", { terminal_window })
    vim.cmd("startinsert")
    vim.api.nvim_feedkeys(command, "", "")
  else
    --apro nuovo terminale e inserisco il comando in base alla modalità
    vim.cmd([[vsplit | terminal]] .. "\n")
    vim.cmd("startinsert")
    vim.api.nvim_feedkeys(command, "", "")
  end
  vim.schedule(function() vim.api.nvim_set_current_win(curr_window) end)
end


local function terminateExecution()
  local curr_window = vim.api.nvim_get_current_win()
  local terminal_window = terminalIsListed()

  if terminal_window == nil then
    print("Non ho nessuna esecuzione in corso")
    return
  else
    --vado alla finestra del terminale
    vim.api.nvim_call_function("win_gotoid", { terminal_window })

    --inserisco il comando in base alla modalità
    vim.cmd("startinsert")
    --forzo il termine dell'esecuzione da terminale
    local key = vim.api.nvim_replace_termcodes("<C-c>", true, false, true)
    vim.api.nvim_feedkeys(key, "n", false)
  end

  vim.schedule(function() vim.api.nvim_set_current_win(curr_window) end)
end
-- <<<<< Comando per compilare


-- >>>>> Keymaps per compilare
vim.api.nvim_buf_set_keymap(0, 'n', '<space>r', '',
  { noremap = true, callback = function() runInActiveTerminal() end })
vim.api.nvim_buf_set_keymap(0, 'n', '<space>R', '',
  { noremap = true, callback = function() terminateExecution() end })
-- <<<<< Keymaps per compilare



-- >>>>> Attacco dell'lsp con jdtls-nvim
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --[[
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  --]]
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

--print("prova")
require('jdtls').start_or_attach({
  -- cmd = {
  --   'java',
  --   '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  --   '-Dosgi.bundles.defaultStartLevel=4',
  --   '-Declipse.product=org.eclipse.jdt.ls.core.product',
  --   '-Dlog.protocol=true',
  --   '-Dlog.level=ALL',
  --   '-Xms1g',
  --   '--add-modules=ALL-SYSTEM',
  --   '--add-opens', 'java.base/java.util=ALL-UNNAMED',
  --
  --
  --   '-jar', sys_settings.jdt.jar,
  --   '-configuration', sys_settings.jdt.configuration,
  --   '-data', vim.fn.expand("~/.cache/jdtls/workspace")
  -- },
  cmd = { "/opt/homebrew/Cellar/jdtls/1.37.0/libexec/bin/jdtls" },
  --root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'pom.xml'}),
  root_dir = vim.api.nvim_buf_get_name(0):match("(.*)/src"),
  on_attach = on_attach,
  update_in_insert = false,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    java = {
      project = {
        referencedLibraries = get_used_libs_jar_files()
      }
    }
  }
})

vim.api.nvim_create_user_command("SetMainfile", function()
  vim.api.nvim_buf_set_var(0, "mainFile", vim.api.nvim_buf_get_name(0))
end, {})
-- <<<<< Attacco dell'lsp con jdtls-nvim
