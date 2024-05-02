--ritorna nil se non esiste un terminale nella tab corrente, altrimenti ritorna il window-id del terminale
local function terminalIsListed()
  local tabs = vim.fn.gettabinfo()
  local active_tab_nr = vim.api.nvim_tabpage_get_number(0)
  local atcive_tab = nil
  --print(vim.inspect(buffers))
  for _, x in ipairs(tabs) do
    if x.tabnr == active_tab_nr then
      active_tab = x
    end
  end

  for _, x in ipairs(active_tab.windows) do
    if vim.fn.getwininfo(x)[1].terminal == 1 then return x end
  end
  return nil
end

--filemode = "single"/"multifile"
local function runInActiveTerminal(file_mode)
  vim.cmd("wa")
  local curr_window = vim.api.nvim_get_current_win()
  local filePath = vim.api.nvim_buf_get_name(0)
  local terminal_window = terminalIsListed()

  if (terminal_window ~= nil) then
    --vado alla finestra del terminale
    vim.api.nvim_call_function("win_gotoid", { terminal_window })

    --inserisco il comando in base alla modalità
    vim.cmd("startinsert")
    if (file_mode == "single") then
      vim.api.nvim_feedkeys([[clang++ -std=c++17 "]] .. filePath .. [[" && ./a.out]] .. "\n", "", "")
    else
      vim.api.nvim_feedkeys([[clang++ -std=c++17 *.cpp -o a.out && ./a.out]] .. "\n", "", "")
    end

    --torno alla finestra su cui ero prima
  else
    --apro nuovo terminale e inserisco il comando in base alla modalità
    vim.cmd([[vsplit | terminal]] .. "\n")
    vim.cmd("startinsert")
    if (file_mode == "single") then
      vim.api.nvim_feedkeys([[clang++ -std=c++17 "]] .. filePath .. [[" -o a.out && ./a.out]] .. "\n", "", "")
    else
      vim.api.nvim_feedkeys([[clang++ -std=c++17 *cpp -o a.out && ./a.out]] .. "\n", "", "")
    end
  end
  vim.schedule(function() vim.api.nvim_set_current_win(curr_window) end)
end

--[[
function openMultifileProject()
  local filePath = vim.api.nvim_buf_get_name(0)
  local fileDir = filePath:match("(.*/)")
  local fileName = string.sub(filePath, string.len(fileDir))
  for element in vim.fs.dir(fileDir) do
     local fileName = element:match("*")
     local fileExtension= string.sub(element, string.len()+1)
     if(fileExtension == 'cpp' && )
  end
end
--]]
--
--

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

vim.api.nvim_buf_set_keymap(0, 'n', '<space>r', '', { noremap = true, callback = function() runInActiveTerminal("single") end })
vim.api.nvim_buf_set_keymap(0, 'n', '<space>m', '', { noremap = true, callback = function() runInActiveTerminal("multifile") end })
vim.api.nvim_set_keymap('n', '<space>R', '', { noremap = true, callback = terminateExecution})

