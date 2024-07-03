-- Default options:
--
--[[
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "",  -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
--]]
--

function Colorscheme(arg)
  vim.cmd.colorscheme(arg)
  removeBackground()
end

vim.api.nvim_create_user_command("Colorscheme", "lua Colorscheme(<q-args>)",
  { nargs = 1, complete = function() return vim.fn.getcompletion("colorscheme ", "cmdline") end })

vim.cmd("Colorscheme gruvbox")
