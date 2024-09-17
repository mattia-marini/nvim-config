require('lint').linters_by_ft = {
  javascript = { 'eslint' }
}

vim.api.nvim_buf_create_user_command(0, "Lint", function()
  require('lint').try_lint()
end, {})
