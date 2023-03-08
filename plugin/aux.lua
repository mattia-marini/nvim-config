function P(arg)
  print(vim.inspect(arg))
end


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
