vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
vim.o.mousescroll = 'ver:1,hor:1'
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.conceallevel = 1
vim.opt.wrap = false
vim.opt.cursorline = true

vim.g.terminal_emulator = 'kitty'
vim.opt.ignorecase = true

vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- vim.keymap.set("n", "<C-I>", "<C-I>")
-- vim.keymap.set("n", "<Tab>", "<Nop>")

-- vim.keymap.set({ 'n', 'i' }, '<Tab>', "<Tab>")


vim.opt.laststatus = 0
vim.opt.cmdheight = 1

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
vim.api.nvim_create_user_command("Analisi", [[cd /Users/mattia/Library/Mobile Documents/com~apple~CloudDocs/LatexWorkspace/Analisi_1]], {})
--]=]
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scroll_animation_far_lines = 9999
  vim.o.guifont = "FuraMono Nerd Font:h18" -- text below applies for VimScript
  -- vim.cmd("colorscheme everforest")
  vim.g.neovide_confirm_quit = true
end
