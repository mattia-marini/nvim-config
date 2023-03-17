-- Opstion vim.opt.number = true
vim.opt.foldenable = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.conceallevel = 1

vim.opt.laststatus = 3
--vim.opt.cmdheight = 0

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
--vim.opt.cintent = false

--vim.opt.smarttab = false
--vim.opt.autoindent = false
--vim.opt.smartindent = false
--vim.opt.indentexpr=""

--vim.opt_local.nocindent = true
--vim.opt_local.nosmartindent = true

--Variables
vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11'

-- Commands
vim.cmd("colorscheme onedark")
vim.api.nvim_create_user_command("EditInit", [[tabnew /Users/mattia/.config/nvim/init.lua]], {})
vim.api.nvim_create_user_command("Plugins", [[tabnew /Users/mattia/.config/nvim/plugin/packer-plugin.lua]], {})
vim.api.nvim_create_user_command("Analisi",
  [[cd /Users/mattia/Library/Mobile Documents/com~apple~CloudDocs/LatexWorkspace/Analisi_1]], {})
vim.api.nvim_create_user_command("EditVimtex", [[tabnew ~/.config/nvim/plugin/vimtex.lua]], {})
vim.api.nvim_create_user_command("Parsers", [[echo nvim_get_runtime_file('parser', v:true)]], {})

function Colorscheme(arg)
  vim.cmd.colorscheme(arg)
  vim.api.nvim_set_hl(0, "Normal", {bg=none})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg=none})
  vim.api.nvim_set_hl(0, "WinSeparator", {bg=none})
  vim.api.nvim_set_hl(0, "TabLineFill", {bg=none})
  vim.api.nvim_set_hl(0, "TabLine", {bg=none})
  vim.api.nvim_set_hl(0, "TabLineSel", {bold = true, italic=true})
end
vim.api.nvim_create_user_command("Colorscheme", "lua Colorscheme(<q-args>)", { nargs = 1, complete= function()return vim.fn.getcompletion("colorscheme ", "cmdline")end })

function getcompletion(arg)
  P(vim.fn.getcompletion("colorscheme ", "cmdline"))
end
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
vim.api.nvim_set_hl(0, "Normal", {bg=none})
vim.api.nvim_set_hl(0, "NormalFloat", {bg=none})
vim.api.nvim_set_hl(0, "WinSeparator", {bg=none})
vim.api.nvim_set_hl(0, "StatusLine", {bg=none})
vim.api.nvim_set_hl(0, "StatusLine", {italic=true})
vim.api.nvim_set_hl(0, "TabLineFill", {bg=none})
vim.api.nvim_set_hl(0, "TabLine", {bg=none})
vim.api.nvim_set_hl(0, "TabLineSel", {bold = true, italic=true})

function prova()
  --local s = vim.api.nvim_buf_get_name(0)
  --local s = "prova/java_workspace/src/progetto/src/prova"
  print(vim.api.nvim_buf_get_name(0):match("(.*)/src"))
end
