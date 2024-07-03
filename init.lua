vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
vim.o.mousescroll = 'ver:1,hor:1'
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.conceallevel = 1
vim.opt.wrap = false
vim.opt.cursorline = true

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)


vim.opt.laststatus = 3
vim.opt.cmdheight = 0

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
--vim.opt.cintent = false

vim.opt.smarttab = false
vim.opt.autoindent = false
vim.opt.smartindent = false

--[=[
vim.opt.indentexpr=""
vim.opt_local.nocindent = true
vim.opt_local.nosmartindent = true
vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11'
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scroll_animation_far_lines = 9999
end
vim.api.nvim_create_user_command("Analisi", [[cd /Users/mattia/Library/Mobile Documents/com~apple~CloudDocs/LatexWorkspace/Analisi_1]], {})
--]=]
-- Commands
vim.api.nvim_create_user_command("EditInit", [[tabnew ~/.config/nvim/init.lua]], {})
vim.api.nvim_create_user_command("Plugins", [[tabnew ~/.config/nvim/plugin/packer-plugin.lua]], {})
vim.api.nvim_create_user_command("Conf", [[tabnew ~/.config/nvim/plugin]], {})
vim.api.nvim_create_user_command("Py",
  [[cd /Users/mattia/Library/Mobile Documents/com~apple~CloudDocs/Workspaces/python_workspace/]], {})
vim.api.nvim_create_user_command("Cpp",
  [[cd /Users/mattia/Library/Mobile Documents/com~apple~CloudDocs/Workspaces/cpp_workspace/]], {})
vim.api.nvim_create_user_command("Js", [[cd /Users/mattia/Library/Mobile Documents/com~apple~CloudDocs/Workspaces/js/]],
  {})
vim.api.nvim_create_user_command("Latex",
  [[cd /Users/mattia/Library/Mobile Documents/com~apple~CloudDocs/Workspaces/latex_workspace/]], {})

-- Maps
vim.api.nvim_set_keymap('n', '<space>w', ':wa<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>q', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
--vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true})
vim.api.nvim_set_keymap('i', 'œ', '<', { noremap = true })
vim.api.nvim_set_keymap('i', 'ø', '>', { noremap = true })
vim.api.nvim_set_keymap('v', 'œ', '<', {})
vim.api.nvim_set_keymap('v', 'ø', '>', {})

vim.api.nvim_set_keymap('n', '<space>n', '<C-w><C-w>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>p', '<C-w><C-p>', { noremap = true })

vim.api.nvim_set_keymap('n', '<space>k', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<space>j', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<space>l', '<C-w>l', {})
vim.api.nvim_set_keymap('n', '<space>h', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<space>s', ':so %<CR>', {})
vim.api.nvim_set_keymap('n', '<space><tab>', 'gt', {})
vim.api.nvim_set_keymap('n', '<space>p', 'gT', {})
vim.api.nvim_set_keymap('n', '<space>E', ':Oil<CR>', {})
vim.api.nvim_set_keymap('n', '<C-h>', '5zh', {})
vim.api.nvim_set_keymap('n', '<C-l>', '5zl', {})

vim.api.nvim_set_keymap('n', '<space>a', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>H', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>n', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>m', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'ml', 'J', { noremap = true })

vim.api.nvim_set_keymap('n', 'K', '5k', {})
vim.api.nvim_set_keymap('v', 'K', '5k', {})
vim.api.nvim_set_keymap('n', 'J', '5j', {})
vim.api.nvim_set_keymap('v', 'J', '5j', {})

vim.api.nvim_set_keymap('n', 'L', '5l', {})
vim.api.nvim_set_keymap('v', 'L', '5l', {})
vim.api.nvim_set_keymap('n', 'H', '5h', {})
vim.api.nvim_set_keymap('v', 'H', '5h', {})


vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-N>', {})


vim.api.nvim_set_keymap('n', 'fa', 'zM', {})
vim.api.nvim_set_keymap('n', 'fA', 'zR', {})
vim.api.nvim_set_keymap('n', '-', 'za', {})
vim.api.nvim_set_keymap('n', '_', 'zA', {})


vim.api.nvim_create_user_command("Parsers", [[echo nvim_get_runtime_file('parser', v:true)]], {})

-- Surround
--[[
vim.api.nvim_create_user_command("Surround", function(args)

  print(args.line1, args.line2)
  local start_pos = vim.api.nvim_buf_get_mark(0, "<")
  local end_pos = vim.api.nvim_buf_get_mark(0, ">")

  local start_row, start_col = start_pos[1], start_pos[2]
  local end_row, end_col = end_pos[1], end_pos[2]

  print(vim.api.nvim_get_mode().mode)

  print(start_row, start_col, end_row, end_col)
end, { range = true })

vim.api.nvim_set_keymap('v', '(', ":Surround<CR>", {
  --[[
  callback = function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)

    vim.schedule(
      function()
        local start_pos = vim.api.nvim_buf_get_mark(0, "<")
        local end_pos = vim.api.nvim_buf_get_mark(0, ">")
        P(start_pos)
        P(end_pos)
      end)

    --local curr_lines = vim.api.nvim_buf_get_lines(0, start_pos[1], end_pos[1], false)
    --local start_pos = vim.fn.getpos("v")
    --local end_pos = vim.api.nvim_win_get_cursor(0)

    local start_row, start_col = start_pos[2], start_pos[3]
    local end_row, end_col = end_pos[2], end_pos[3]

    --P(vim.region(0, "'<", "'>", "V", true))


    --local selected_text = vim.fn.getline("'<", "'>")
    --P(selected_text)
  end
})

    --]]
