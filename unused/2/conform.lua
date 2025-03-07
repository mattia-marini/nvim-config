require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier"},
    html = { "prettier"},
    ["*"] = { "injected" },
  },
  log_level = vim.log.levels.DEBUG,
  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_format = "fallback",
  -- },
})

require("conform").formatters.injected = {
  -- Set the options field
  options = {
    ignore_errors = false,
  }
}


vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
