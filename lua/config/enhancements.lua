-- Quickfix enhancements
local remove_qf_item = require("utils.quickfix").remove_qf_item

vim.api.nvim_create_user_command("RemoveQFItem", remove_qf_item, {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "dd", remove_qf_item, { buffer = true })
  end
})


-- Limit lines lenght
local format = require("utils.format")
vim.api.nvim_create_user_command("HardWrapLines", function(opts)
  format.hard_wrap_lines(opts.line1, opts.line2, tonumber(opts.args) or 80)
end, {
  range = true,
  complete = function(arglead, cmdargs)
  end,
  nargs = "?",
})
