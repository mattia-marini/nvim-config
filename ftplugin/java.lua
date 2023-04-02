--ritorna nil se non esiste un terminale nella tab corrente, altrimenti ritorna il window-id del terminale
local sys_settings = require("sys_settings")

local function terminalIsListed()
  local tabs = vim.fn.gettabinfo()
  local active_tab_nr = vim.api.nvim_tabpage_get_number(0)
  local atcive_tab = nil
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

local function getRoot()
  local rv = vim.fs.find("src", { upward = true, type = "directory", path = vim.fn.getcwd() })
  if #rv == 0 then return "Unresolved" end
  return rv[1]
end
local root = getRoot()
if root == "Unresolved" then
  vim.api.nvim_echo({{"Cannot resolve root dir. Be sure to have a \"src\" folder in you project", "DiffText"}}, false, {})
  return
end
vim.api.nvim_buf_set_var(0, "rootDir", root)


local function getMainFile()
  local rv = vim.fs.find("Main.java", { type = "file", path = vim.api.nvim_buf_get_var(0, "rootDir") })
  if #rv == 0 then return "Unresolved" end
  return rv[1]
end
vim.api.nvim_buf_set_var(0, "mainFile", getMainFile())


local function getCompilationPath()
  if vim.api.nvim_buf_get_var(0, "mainFile") == "Unresolved" then return "Unresolved" end
  local rv = vim.api.nvim_buf_get_var(0, "mainFile"):match("/src/(.*).java")
  return rv
end
vim.api.nvim_buf_set_var(0, "compilationPath", getCompilationPath())


local function runInActiveTerminal()
  vim.cmd("wa")
  local curr_window = vim.api.nvim_get_current_win()
  local terminal_window = terminalIsListed()
  local rootDir = vim.api.nvim_buf_get_var(0, "rootDir")
  local compilationPath = vim.api.nvim_buf_get_var(0, "compilationPath")

  if (terminal_window ~= nil) then
    --vado alla finestra del terminale
    vim.api.nvim_call_function("win_gotoid", { terminal_window })
    vim.cmd("startinsert")
    vim.api.nvim_feedkeys(
      "cd \"" ..
      rootDir .. [[" && javac -d ../bin ]] .. compilationPath .. [[.java && cd ../bin && java ]] .. compilationPath:gsub("/", ".") .. "\n",
      "", "")
  else
    --apro nuovo terminale e inserisco il comando in base alla modalità
    vim.cmd([[vsplit | terminal]] .. "\n")
    vim.cmd("startinsert")
    vim.api.nvim_feedkeys(
      "cd \"" ..
      rootDir .. [[" && javac -d ../bin ]] .. compilationPath .. [[.java && cd ../bin && java ]] .. compilationPath:gsub("/", ".") .. "\n",
      "", "")
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


vim.api.nvim_buf_set_keymap(0, 'n', '<space>r', '',
  { noremap = true, callback = function() runInActiveTerminal() end })
vim.api.nvim_buf_set_keymap(0, 'n', '<space>R', '',
  { noremap = true, callback = function() terminateExecution() end })










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

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
  require('jdtls').start_or_attach({
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
      'java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',


      '-jar',sys_settings.jdt.jar,
      '-configuration', sys_settings.jdt.configuration,
      '-data', "/Users/mattia/.cache/jdtls/workspace"
    },
    --root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'pom.xml'}),
    root_dir = vim.api.nvim_buf_get_name(0):match("(.*)/src"),
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }
)
