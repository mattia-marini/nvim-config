vim.api.nvim_create_autocmd({ "VimEnter", "VimResume", "UIEnter" }, {
  group = vim.api.nvim_create_augroup("KittySetVarVimEnter", { clear = true }),
  callback = function()
    if vim.api.nvim_ui_send then
      vim.api.nvim_ui_send("\x1b]1337;SetUserVar=in_editor=MQo\007")
    else
      io.stdout:write("\x1b]1337;SetUserVar=in_editor=MQo\007")
    end
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  group = vim.api.nvim_create_augroup("KittyUnsetVarVimLeave", { clear = true }),
  callback = function()
    if vim.api.nvim_ui_send then
      vim.api.nvim_ui_send("\x1b]1337;SetUserVar=in_editor=MQo\007")
    else
      io.stdout:write("\x1b]1337;SetUserVar=in_editor\007")
    end
  end,
})
