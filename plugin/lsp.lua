local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  print("nvim_lsp")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
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

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { noremap = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap = true })


vim.diagnostic.config({ signs = false })


require('lspconfig').clangd.setup {
  --cmd = {'clangd', '--fallback-style=/Users/mattia/Desktop/clang-format'},
  on_attach = on_attach,
  update_in_insert = false,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
  --capabilities = require('cmp_nvim_lsp').default_capabilities()
}

require('lspconfig').texlab.setup {
  cmd = { 'texlab', '-vvvv' },
  on_attach = on_attach,
  update_in_insert = false,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}

require 'lspconfig'.lua_ls.setup {
  cmd = { 'lua-language-server-wrapper' },
  on_attach = on_attach,
  update_in_insert = false,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'use' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require 'lspconfig'.millet.setup {
  cmd = { 'millet-ls' },
  on_attach = on_attach,
  update_in_insert = false,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  single_file_support = true
  --root_dir = function()return vim.fn.getcwd()end
}
