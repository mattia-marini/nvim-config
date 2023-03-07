local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  print("nvim_lsp")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --[[
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  --]]
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

--[[
require("lspconfig").sumneko_lua.setup{
  on_attach = on_attach,
  update_in_insert = false,
  telemetry = {
        enable = false,
      }
}
--]]


vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, {noremap=true})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {noremap=true})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {noremap=true})
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, {noremap=true})


vim.diagnostic.config({ signs = false })


require('lspconfig').clangd.setup {
    --cmd = {'clangd', '--fallback-style=/Users/mattia/Desktop/clang-format'},
    on_attach = on_attach,
    update_in_insert = false,
    --capabilities = require('cmp_nvim_lsp').default_capabilities()
}

require('lspconfig').texlab.setup {
    cmd = {'texlab', '-vvvv'},
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}

--[[
require('lspconfig').texlab.setup{
capabilities = require('cmp_nvim_lsp').default_capabilities(),
filetypes = { "tex", "plaintex", "bib" },
on_attach = on_attach,
update_in_insert = false,

settings={
  texlab = {
    auxDirectory = ".",
    bibtexFormatter = "texlab",
    build = {
      args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
      executable = "latexmk",
      forwardSearchAfter = false,
      onSave = false
    },
    chktex = {
      onEdit = true,
      onOpenAndSave = true
    },
    diagnosticsDelay = 0,
    formatterLineLength = 80,
    forwardSearch = {
      args = {}
    },
    latexFormatter = "latexindent",
    latexindent = {
      modifyLineBreaks = false
    }
  }
  }
}
--]]
