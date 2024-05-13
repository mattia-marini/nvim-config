-- Opstion vim.opt.number = true
--vim.opt.foldenable = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.conceallevel = 1
vim.opt.wrap = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false
--vim.opt.foldtext = vim.treesitter.foldtext()

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
--vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11'

-- Commands
vim.cmd("colorscheme rose-pine")
vim.api.nvim_create_user_command("EditInit", [[tabnew ~/.config/nvim/init.lua]], {})
vim.api.nvim_create_user_command("Plugins", [[tabnew ~/.config/nvim/plugin/packer-plugin.lua]], {})
--vim.api.nvim_create_user_command("Analisi", [[cd /Users/mattia/Library/Mobile Documents/com~apple~CloudDocs/LatexWorkspace/Analisi_1]], {})
--vim.api.nvim_create_user_command("EditVimtex", [[tabnew ~/.config/nvim/plugin/vimtex.lua]], {})
--vim.api.nvim_create_user_command("Parsers", [[echo nvim_get_runtime_file('parser', v:true)]], {})

function Colorscheme(arg)
  vim.cmd.colorscheme(arg)
  vim.api.nvim_set_hl(0, "Normal", { bg = none })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = none })
  vim.api.nvim_set_hl(0, "WinSeparator", { bg = none })
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = none })
  vim.api.nvim_set_hl(0, "TabLine", { bg = none })
  vim.api.nvim_set_hl(0, "TabLineSel", { bold = true, italic = true })
end

vim.api.nvim_create_user_command("Colorscheme", "lua Colorscheme(<q-args>)",
  { nargs = 1, complete = function() return vim.fn.getcompletion("colorscheme ", "cmdline") end })

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
vim.api.nvim_set_hl(0, "Normal", { bg = none })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = none })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = none })
vim.api.nvim_set_hl(0, "StatusLine", { bg = none })
vim.api.nvim_set_hl(0, "StatusLine", { italic = true })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = none })
vim.api.nvim_set_hl(0, "TabLine", { bg = none })
vim.api.nvim_set_hl(0, "TabLineSel", { bold = true, italic = true })
vim.api.nvim_set_hl(0, "Pmenu", { bg = none })
vim.api.nvim_set_hl(0, "NormalNC", { bg = none })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = none })


vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })

function MyFold()
  local line = vim.fn.getline(vim.v.lnum)
  --return line:match("fold") and 1 or 0
  vim.treesitter.get_node({ 0, { cursor_position[1] - 1, cursor_position[2] }, true })
end

function GetNode()
  --local lineLength = vim.fn.col('$')-1
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local lineLength = vim.fn.col('$') - 1
  local nodes = {}

  --print(lineLength)
  local formerNode = nil
  for i = 1, lineLength do
    local node = vim.treesitter.get_node({ pos = { cursor_position[1] - 1, i - 1 } })
    --print(i .. node:type())
    --print(i .. node:type())
    if node:type() ~= formerNode then
      table.insert(nodes, node:type())
      formerNode = node:type()
    end
  end

  P(nodes)
  --P(node:type())
end

function getNodeUnderCursor()
  local node = vim.treesitter.get_node({ bufnr = 0, pos = { 144, 1 }, ignore_injections = true })
  print(node)
end

--vim.api.nvim_set_keymap('n', 'ee', ': lua MyFold()<CR>', {})
--vim.api.nvim_set_keymap('n', 'pc', ': lua GetNode()<CR>', {})
--vim.api.nvim_set_keymap('n', 'pC', ': lua getNodeUnderCursor()<CR>', {})

--_G.get_my_fold = MyFold

--vim.opt.foldexpr = "v:lua.get_my_fold()"
--fold
--fold
--fold
--
--fold
--fold

--fold
--fold
--fold


--vim.api.nvim_set_keymap('n', 'ee', ': lua Prova()<CR>', {})
