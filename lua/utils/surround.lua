local surround = {}

local utils = require('my_utils')

function surround.surround(l, r)
  local low_row, low_col, high_row, high_col = utils.getSelectionBound()
  local text = vim.api.nvim_buf_get_lines(0, low_row - 1, high_row, true)
  local line_count = #text
  text[line_count] = text[line_count]:sub(1, high_col - 1) .. r .. text[line_count]:sub(high_col)
  text[1] = text[1]:sub(1, low_col - 1) .. l .. text[1]:sub(low_col)
  --P(text[line_count])
  vim.api.nvim_buf_set_lines(0, low_row - 1, high_row, true, text)

  --[[
  if vim.api.nvim_get_mode().mode == "v" then
    local crow, ccol = unpack(vim.api.nvim_win_get_cursor(0))
    ccol = ccol +1
    if low_row == high_row then
      if ccol == low_col then
        vim.api.nvim_buf_set_mark(0, '>', low_row, high_col + 5, {})
      else
        vim.api.nvim_win_set_cursor(0, { high_row, high_col + 1 })
      end
    end
  end
  --]]
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)

end

return surround
