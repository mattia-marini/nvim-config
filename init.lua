



vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
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
vim.o.mousescroll = 'ver:1,hor:1'

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
--vim.opt.indentexpr=""

--vim.opt_local.nocindent = true
--vim.opt_local.nosmartindent = true

--Variables
--vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11'

--[[
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scroll_animation_far_lines = 9999
end
--]]


-- Commands
vim.api.nvim_create_user_command("EditInit", [[tabnew ~/.config/nvim/init.lua]], {})
vim.api.nvim_create_user_command("Plugins", [[tabnew ~/.config/nvim/plugin/packer-plugin.lua]], {})
--vim.api.nvim_create_user_command("Analisi", [[cd /Users/mattia/Library/Mobile Documents/com~apple~CloudDocs/LatexWorkspace/Analisi_1]], {})
--vim.api.nvim_create_user_command("EditVimtex", [[tabnew ~/.config/nvim/plugin/vimtex.lua]], {})
--vim.api.nvim_create_user_command("Parsers", [[echo nvim_get_runtime_file('parser', v:true)]], {})




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


--mette background trasparente
function removeBackground()
  vim.api.nvim_set_hl(0, "Normal", { bg = none })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = none })
  vim.api.nvim_set_hl(0, "WinSeparator", { bg = none })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = none})
  vim.api.nvim_set_hl(0, "StatusLine", { italic = true })

  --vim.api.nvim_set_hl(0, "TabLineFill", { bg = none })
  --vim.api.nvim_set_hl(0, "TabLine", { bg = none })
  --vim.api.nvim_set_hl(0, "TabLineSel", { bold = true, italic = true })

  vim.api.nvim_set_hl(0, "Pmenu", { bg = none })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = none })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = none })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = none })

  vim.api.nvim_set_hl(0, "Normal", { bg = none })
  --vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
end

vim.api.nvim_set_keymap('n', 'fa', 'zM', {})
vim.api.nvim_set_keymap('n', 'fA', 'zR', {})
vim.api.nvim_set_keymap('n', '-', 'za', {})
vim.api.nvim_set_keymap('n', '_', 'zA', {})


