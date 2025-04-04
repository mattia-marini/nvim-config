-- require 'nvim-treesitter.configs'.setup {
--   -- A list of parser names, or "all" (the four listed parsers should always be installed)
--   --ensure_installed = { "c", "lua", "vim", "help" },
--
--   -- Install parsers synchronously (only applied to `ensure_installed`)
--   --sync_install = false,
--
--   -- Automatically install missing parsers when entering buffer
--   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--   --auto_install = true,
--
--   -- List of parsers to ignore installing (for "all")
--   --ignore_install = { "tex" },
--
--   ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
--   -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false,
--   },
--
--   indent = {
--     enable = true,
--   },
--
--   incremental_selection = {
--     enable = true,
--   },
-- }

return
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "rust", "java", "latex" },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
    })
  end,
}
