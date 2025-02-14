local remove_qf_item = require("utils.quickfix").remove_qf_item

vim.api.nvim_create_user_command("RemoveQFItem", remove_qf_item, {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "dd", remove_qf_item, { buffer = true })
  end
})
