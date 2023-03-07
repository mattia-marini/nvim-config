vim.g.UltiSnipsSnippetDirectories={"~/.config/nvim/plugin/USsnippets"}

vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'


--vim.api.nvim_create_autocmd({"BufReadPost"}, {pattern = "*", command = [[call timer_start(0, {-> execute("call UltiSnips#RefreshSnippets() ")})]]})
--vim.cmd("call Uultisnips#refreshsnippets()")

