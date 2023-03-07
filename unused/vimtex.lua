vim.opt.conceallevel=1



vim.g.tex_flavor='latex'
vim.g.vimtex_view_method='skim'
vim.g.vimtex_view_skim_sync=1
vim.g.vimtex_view_skim_activate=1

vim.g.vimtex_indent_enabled=false
vim.g.vimtex_quickfix_mode=true

vim.g.tex_nospell=true
vim.g.tex_no_error=true
vim.g.tex_verbspell=false
vim.g.tex_comment_nospell= true



--[[
vim.g.vimtex_matchparen_enabled = false
vim.g.vimtex_fold_enabled = false 
vim.g.vimtex_complete_recursive_bib=false
vim.g.vimtex_syntax_enabled = false
vim.g.vimtex_toc_enabled = false
vim.g.vimtex_motion_enabled = false
--vim.g.vimtex_quickfix_enabled = false
vim.g.vimtex_text_obj_enabled =true
--vim.g.vimtex_view_enabled = false
vim.g.vimtex_complete_enable = false
vim.g.vimtex_fold_bib_enabled = false
vim.g.vimtex_indent_enabled = false
vim.g.vimtex_indent_bib_enabled = false
vim.g.vimtex_doc_enabled = false
vim.g.vimtex_include_search_enabled = false
vim.g.vimtex_viewer_check = false
--]]


vim.g.vimtex_syntax_conceal = {
           accents= true,
           ligatures= true,
           cites= true,
           fancy= true,
           greek= false,
           math_bounds= 0,
           math_delimiters= 0,
           math_fracs= true,
           math_super_sub= false,
           math_symbols= true,
           sections= false,
           styles= true
}


vim.cmd([[
augroup VimTeX
  autocmd!
  autocmd BufReadPre *.tex let b:vimtex_main = "main.tex" 
augroup END
]])


vim.g.vimtex_quickfix_ignore_filters = {
       'Underfull',
       'Overfull',
       'Warning',
     } 
