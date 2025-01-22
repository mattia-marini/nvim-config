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
vim.api.nvim_set_keymap('n', '<space><tab>', 'gt', {})
vim.api.nvim_set_keymap('n', '<space>p', 'gT', {})
vim.api.nvim_set_keymap('n', '<space>e', ':Oil<CR>', {})
vim.api.nvim_set_keymap('n', '<space>E', ':vsplit | Oil<CR>', {})
vim.api.nvim_set_keymap('n', '<C-h>', '5zh', {})
vim.api.nvim_set_keymap('n', '<C-l>', '5zl', {})
vim.api.nvim_set_keymap('n', 'gp', '<c-6>', {})

-- vim.api.nvim_set_keymap('n', '<space>a', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<space>H', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<space>n', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<space>m', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'ml', 'J', { noremap = true })


-- Folding
vim.api.nvim_set_keymap('n', 'fa', 'zM', {})
vim.api.nvim_set_keymap('n', 'fA', 'zR', {})
vim.api.nvim_set_keymap('n', '-', 'za', {})
vim.api.nvim_set_keymap('n', '_', 'zA', {})


-- Misc/util
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-N>', {})


-- Surround
-- vim.api.nvim_set_keymap('v', '(', "", { callback = function() require('lua.utils.surround').surround('(', ')') end })
-- vim.api.nvim_set_keymap('v', ')', "", { callback = function() require('lua.utils.surround').surround('(', ')') end })
-- vim.api.nvim_set_keymap('v', '[', "", { callback = function() require('lua.utils.surround').surround('[', ']') end })
-- vim.api.nvim_set_keymap('v', ']', "", { callback = function() require('lua.utils.surround').surround('[', ']') end })
-- vim.api.nvim_set_keymap('v', '{', "", { callback = function() require('lua.utils.surround').surround('{', '}') end })
-- vim.api.nvim_set_keymap('v', '}', "", { callback = function() require('lua.utils.surround').surround('{', '}') end })
-- vim.api.nvim_set_keymap('v', '<', "", { callback = function() require('lua.utils.surround').surround('<', '>') end })
-- vim.api.nvim_set_keymap('v', '>', "", { callback = function() require('lua.utils.surround').surround('<', '>') end })
-- vim.api.nvim_set_keymap('v', '"', "", { callback = function() require('lua.utils.surround').surround('"', '"') end })
-- vim.api.nvim_set_keymap('v', '\'', "", { callback = function() require('lua.utils.surround').surround('\'', '\'') end })


-- Movement
vim.api.nvim_set_keymap('i', '<C-h>', "<Left>", {})
vim.api.nvim_set_keymap('i', '<C-l>', "<Right>", {})
vim.api.nvim_set_keymap('i', '<C-k>', "<Up>", {})
vim.api.nvim_set_keymap('i', '<C-j>', "<Down>", {})

vim.api.nvim_set_keymap('n', 'K', '5k', {})
vim.api.nvim_set_keymap('v', 'K', '5k', {})
vim.api.nvim_set_keymap('n', 'J', '5j', {})
vim.api.nvim_set_keymap('v', 'J', '5j', {})


vim.api.nvim_set_keymap('n', '<C-j>', "<C-d>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', "<C-u>", { noremap = true })

-- vim.keymap.set({'n', 'v'}, '<C-k>', '<C-u>zz', {noremap = true})
-- vim.keymap.set({'n', 'v'}, '<C-j>', '<C-d>zz', {noremap = true})

vim.keymap.set({ 'n', 'v' }, 'L', '5l', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'H', '5h', { noremap = true })

-- Comments
vim.api.nvim_set_keymap('v', 'c', '<Plug>(comment_toggle_linewise_visual)', {})
vim.api.nvim_set_keymap('v', 'C', '<Plug>(comment_toggle_blockwise_visual)', {})

-- Travel by brakets
local nav = require("utils.nav")
vim.keymap.set("n", "<C-8>", nav.go_to_prev_paired_char)
vim.keymap.set("n", "<C-9>", nav.go_to_next_paired_char)
