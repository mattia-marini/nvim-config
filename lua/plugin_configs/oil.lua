--prova
require("oil").setup {
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-h>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
    ["gp"] = "actions.preview",
    ["<Space>w"] = ":w<CR>",
    ["<Esc>"] = ":q<CR>",
    ['Y'] = "actions.yank_entry"
    -- ['yp'] = {
    --   desc = 'Copy filepath to system clipboard',
    --   callback = function()
    --     require('oil.actions').copy_entry_path.callback()
    --     vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
    --   end,
    -- },
  },
  delete_to_trash = true,
}
