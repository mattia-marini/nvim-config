--[[
local builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fb", builtin.buffers, {})
--vim.api.nvim_set_keymap( "n", "<space>fb", ":Telescope file_browser<CR><Esc>l", { noremap = true })
require("telescope").setup {}
--[[
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
--]]

--require("telescope").load_extension("file_browser")
--]]
