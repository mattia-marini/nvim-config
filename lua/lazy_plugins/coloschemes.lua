local function default_coloscheme(name, name2)
  return {
    name,
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("utils.colorscheme").colorscheme_no_bg(name2)
    end
  }
end

return {

  { 'neanias/everforest-nvim',     lazy = true },
  { 'arcticicestudio/nord-vim',    lazy = true },
  { 'mhartington/oceanic-next',    lazy = true },
  { 'glepnir/oceanic-material',    lazy = true },
  { 'projekt0n/github-nvim-theme', lazy = true },
  { 'arzg/vim-colors-xcode',       lazy = true },
  { 'ellisonleao/gruvbox.nvim',    lazy = true },
  { 'joshdick/onedark.vim',        lazy = true },
  { 'embark-theme/vim',            as = 'embark',     lazy = true },
  { 'rose-pine/neovim',            as = 'rose-pine',  lazy = true },
  { 'catppuccin/vim',              as = 'catppuccin', lazy = true },

  default_coloscheme("rose-pine/neovim", "rose-pine"),
}
