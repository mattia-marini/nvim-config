-- Opstion vim.opt.number = true
vim.opt.foldenable = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
vim.opt.splitright = true
vim.opt.termguicolors= true
vim.opt.number = true
vim.opt.conceallevel = 1

vim.opt.laststatus = 3
--vim.opt.cmdheight = 0

vim.opt.tabstop = 2
vim.opt.shiftwidth=2
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
vim.api.nvim_create_user_command("Analisi", [[cd /Users/mattia/Library/Mobile Documents/com~apple~CloudDocs/LatexWorkspace/Analisi_1]], {})
vim.api.nvim_create_user_command("EditVimtex", [[tabnew ~/.config/nvim/plugin/vimtex.lua]], {})
vim.api.nvim_create_user_command("Parsers", [[echo nvim_get_runtime_file('parser', v:true)]], {})
--Setta il colorscheme con background trasparente
function Colorscheme(arg)
  vim.cmd.colorscheme(arg)
  vim.api.nvim_set_hl(0, "Normal", {bg=none})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg=none})
end

function BG()
  vim.api.nvim_set_hl(0, "Normal", {bg=none})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg=none})
end

vim.api.nvim_create_user_command("Colorscheme", "lua Colorscheme(<q-args>)", { nargs = 1 })

-- Maps
vim.api.nvim_set_keymap('n', '<space>w', ':wa<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>q', ':q<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
--vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true})
vim.api.nvim_set_keymap('i', 'œ', '<', {noremap = true})
vim.api.nvim_set_keymap('i', 'ø', '>', {noremap = true})
vim.api.nvim_set_keymap('v', 'œ', '<', {})
vim.api.nvim_set_keymap('v', 'ø', '>', {})
vim.api.nvim_set_keymap('n', '<space>r', ':lua runInActiveTerminal("single")<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>m', ':lua runInActiveTerminal("multifile")<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>R', ':lua terminateExecution()<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<space>n', '<C-w><C-w>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>p', '<C-w><C-p>', {noremap = true})

vim.api.nvim_set_keymap('n', '<space>k', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<space>j', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<space>l', '<C-w>l', {})
vim.api.nvim_set_keymap('n', '<space>h', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<space>s', ':so %<CR>', {})
vim.api.nvim_set_keymap('n', '<space><tab>', 'gt', {})
vim.api.nvim_set_keymap('n', '<space>p', 'gT', {})

vim.api.nvim_set_keymap('n', 'ml', 'J', {noremap = true})

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

function P(arg)
  print(vim.inspect(arg))
end

------------------------------env detection


function math_env()
  --P(vim.treesitter.get_captures_at_cursor(0))
  local cursor_position = vim.api.nvim_win_get_cursor(0)          
  local node = vim.treesitter.get_node({0, {cursor_position[1]-1, cursor_position[2]}, true})

  while node ~= nill do 
    --P(node:type())text_mode
    if(node:type() == 'text_mode')then return false end
    if(node:type() == 'displayed_equation' or node:type() == 'math_environment' or node:type() == 'inline_formula')then return true end
    node = node:parent()
  end
  
  return false
end

function context()
  --P(vim.treesitter.get_captures_at_cursor(0))
  local cursor_position = vim.api.nvim_win_get_cursor(0)          
  local node = vim.treesitter.get_node({0, {cursor_position[1]-1, cursor_position[2]}, true})
  
  if math_env() then return "math" end

  while node ~= nill do 
  
    if node:type() == "generic_environment" then 

      local env_name = node:field("begin")[1]:field("name")[1]:field("text")[1]:field("word")[1]
      local row, start_column = env_name:start()

      local _,end_column  = env_name:end_()
      return(vim.api.nvim_buf_get_lines(0, row, row+1, false)[1]:sub(start_column+1, end_column))

    end
    node = node:parent()
  end
return nil
end

vim.api.nvim_set_keymap('n', '<space>e', ':lua print(print_env())<CR>', {noremap = true})

function compile()
  local on_exit = function() print("compilato correttamente") end
  handle = vim.loop.spawn("latexmk", {args = {"main.tex", "-pdf"}}, on_exit)
end

--vim.api.nvim_create_user_command("VimtexInverseSearch", "lua inverse_search(<q-args>)", { nargs = 1 })

------------------------------------------------------------------------
--require("my_vimtex.inverse_search")

local hi_groups = {
"ColorColumn",
"Conceal",
"CurSearch",
"Cursor",
"lCursor",
"CursorIM",
"CursorColumn",
"CursorLine",
"Directory",
"DiffAdd",
"DiffChange",
"DiffDelete",
"DiffText",
"EndOfBuffer",
"TermCursor",
"TermCursorNC",
"ErrorMsg",
"WinSeparator",
"Folded",
"FoldColumn",
"SignColumn",
"Substitute",
"LineNr",
"LineNrAbove",
"LineNrBelow",
"CursorLineNr",
"CursorLineFold",
"CursorLineSign",
"MatchParen",
"ModeMsg",
"MsgArea",
"MsgSeparator",
"MoreMsg",
"NonText",
"Normal",
"NormalFloat",
"NormalNC",
"Pmenu",
"PmenuSel",
"PmenuSbar",
"PmenuThumb",
"Question",
"QuickFixLine",
"Search",
"SpecialKey",
"SpellBad",
"SpellCap",
"SpellLocal",
"SpellRare",
"StatusLine",
"StatusLineNC",
"TabLine",
"TabLineFill",
"TabLineSel",
"Title",
"Visual",
"VisualNOS",
"WarningMsg",
"Whitespace",
"WildMenu",
"WinBar"}

local ts_hi_groups = {
"@tag",
"@type",
"@debug",
"@field",
"@float",
"@label",
"@macro",
"@define",
"@method",
"@number",
"@repeat",
"@string",
"@boolean",
"@comment",
"@include",
"@keyword",
"@preproc",
"@constant",
"@function",
"@operator",
"@property",
"@text.uri",
"@variable",
"@character",
"@exception",
"@namespace",
"@parameter",
"@structure",
"@text.todo",
"@text.title",
"@conditional",
"@constructor",
"@punctuation",
"@storageclass",
"@text.literal",
"@string.escape",
"@constant.macro",
"@function.macro",
"@string.special",
"@text.reference",
"@text.underline",
"@type.definition",
"@constant.builtin",
"@function.builtin",
}
function print_hi_group()
  for _, hg in ipairs(ts_hi_groups) do 
    --print(hg)
    vim.api.nvim_echo({{hg, hg}}, false, {})
  end
end

function print_vim_hi_group()
  for _, hg in ipairs(hi_groups) do 
    --print(hg)
    vim.api.nvim_echo({{hg, hg}}, false, {})
  end
end


vim.api.nvim_set_keymap('n', '<space>c', ':lua comment()', {noremap = true})
function comment()
  print(vim.api.nvim_buf_get_mark(0, "<")[1])
  print(vim.api.nvim_buf_get_mark(0, ">")[1])
  vim.cmd([[<C-v>]])
end


vim.api.nvim_create_user_command("Print", "lua foo(<q-args>)", {nargs=1})

