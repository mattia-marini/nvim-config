--print("ftplugin sourced")
--

local function onExit(obj)
  print(obj.stdout)
end
vim.system({"echo", "prova"}, {text = true}, onExit)



--[[
vim.api.nvim_buf_set_var(0, "t", {1})

vim.api.nvim_create_user_command("PANDINC", function()
  local t = vim.api.nvim_buf_get_var(0, "t")

  for _, x in ipairs(t) do
    print(x)
  end

  table.insert(t, t[#t] + 1)
  vim.api.nvim_buf_set_var(0, "t", t)
end, {})



local x = 0

vim.api.nvim_create_user_command("PANDINC", function() 
  print(x)
  x = x+1
end, {})
--]]
--vim.api.nvim_buf_set_var(0, "t", {1})
--vim.api.nvim_set_vvar("ELIMINA", 42)
