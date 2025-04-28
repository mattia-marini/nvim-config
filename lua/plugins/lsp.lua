local function config()
  local on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true)
    -- Enable completion triggered by <c-x><c-o>
    --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set({ 'i', 'n' }, '<C-u>', vim.lsp.buf.signature_help, bufopts)
    --vim.keymap.set('i', '<C-i>', vim.lsp.buf.signature_help, bufopts)


    --vim.keymap.set('i', '<C-i>', vim.lsp.buf.signature_help, bufopts)
    --[[
  vim.keymap.set('i', '<C-i>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('i', '<C-i>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('i', '<C-i>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  --]]
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>N', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('v', '<space>a', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = false } end, bufopts)
    --
    vim.api.nvim_create_user_command("ToggleHints", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    end, {})
  end

  local ufo_capabilities = vim.lsp.protocol.make_client_capabilities()
  ufo_capabilities.textDocument.foldingRange = {
    --for ufo lsp folding
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
  -- local cmp_capabilities = capabilities
  local cmp_capabilities = require('blink.cmp').get_lsp_capabilities()
  -- local cmp_capabilities = {}
  local capabilities = {}

  for key, value in pairs(cmp_capabilities) do capabilities[key] = value end
  for key, value in pairs(ufo_capabilities) do capabilities[key] = value end




  vim.keymap.set('n', 'ge', vim.diagnostic.open_float, { noremap = true })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true })
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap = true })


  vim.diagnostic.config({ signs = false })


  require('lspconfig').clangd.setup {
    --cmd = {'clangd', '--fallback-style=/Users/mattia/Desktop/clang-format'},
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities
    --capabilities = capabilities
  }

  require('lspconfig').texlab.setup {
    cmd = { 'texlab', '-vvvv' },
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities
  }

  require 'lspconfig'.lua_ls.setup {
    cmd = { 'lua-language-server-wrapper' },
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          -- globals = { 'vim', 'use' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library =
              (function()
                local libs = {}

                -- Nvim apis
                for _, lib in ipairs(vim.api.nvim_get_runtime_file("", true)) do
                  table.insert(libs, lib)
                end

                --  LuaRocks
                -- local luarocks_paths = vim.system({ "luarocks", "config", "rocks_trees" }, { text = true }):wait()
                -- if luarocks_paths.code == 0 then
                --   for path in luarocks_paths.stdout:gmatch("root%s*=%s*\"([^,]*)\"") do
                --     table.insert(libs, path)
                --     print(path)
                --   end
                -- else
                --   print("Couln't get luarocks paths")
                -- end

                table.insert(libs, vim.fs.normalize("~/.luarocks"))
                print(vim.inspect(libs))
                -- for _, lib in luarocks_paths do
                --   table.insert(libs, lib)
                -- end

                return libs
              end)(),
          checkThirdParty = false
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
    capabilities = capabilities,
    single_file_support = true
    --root_dir = function()return vim.fn.getcwd()end
  }

  require 'lspconfig'.sourcekit.setup {
    --single_file_support = true,
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities,
    filetypes = { "swift", "metal" },
    root_dir = require('lspconfig').util.root_pattern("buildServer.json", "*.xcodeproj", "*.xcworkspace", ".git",
      "compile_commands.json", "Package.swift")
  }

  require 'lspconfig'.ts_ls.setup {
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities,
    commands = {
      OrganizeImports = {
        function()
          local params = {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
            title = ""
          }
          vim.lsp.buf.execute_command(params)
        end,
        description = "Organize imports"
      },
    }
  }

  require 'lspconfig'.cssls.setup {
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities,
  }

  -- require 'lspconfig'.superhtml.setup {
  --   on_attach = on_attach,
  --   update_in_insert = false,
  --   capabilities = capabilities
  -- }
  -- require 'lspconfig'.htmx.setup {
  --   on_attach = on_attach,
  --   update_in_insert = false,
  --   capabilities = capabilities
  -- }
  require 'lspconfig'.html.setup {
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities,
    filetypes = { "html", "templ", "jsp" }
  }

  require 'lspconfig'.emmet_language_server.setup {
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities
  }

  require 'lspconfig'.rust_analyzer.setup {
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities
  }


  require 'lspconfig'.jdtls.setup {

    -- cmd = { 'jdtls' },
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities,
    root_dir = function()
      return vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'mvn', 'pom.xml' }, { upward = true })[1])
    end,
    single_file_support = false
    -- root_dir = function()
    --   local root_files = {
    --     'settings.gradle',     -- Gradle (multi-project)
    --     'settings.gradle.kts', -- Gradle (multi-project)
    --     'build.xml',           -- Ant
    --     'pom.xml',             -- Maven
    --   }
    --
    --   local fallback_files = {
    --     'build.gradle',     -- Gradle
    --     'build.gradle.kts', -- Gradle
    --   }
    --
    --   local primary = vim.fs.root(0, root_files)
    --   local fallback_1 = vim.fs.root(0, fallback_files)
    --   local fallback_2 = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
    --
    --   local root = primary or fallback_1 or fallback_2
    --   print(root)
    --   return root
    -- end,

    -- root_dir = vim.fs.root(0, "build.gradle.kts"),
    -- root_dir = function()
    --   return "/Users/mattia/Desktop/java/app/"
    -- end,
    -- single_file_support = false


    --[[ root_dir = function(fname)
    local root_files = {
      'settings.gradle',   -- Gradle (multi-project)
      'settings.gradle.kts', -- Gradle (multi-project)
      'build.xml',         -- Ant
      'pom.xml',           -- Maven
    }

    local fallback_root_files = {
      'build.gradle',   -- Gradle
      'build.gradle.kts', -- Gradle
    }

    local primary = vim.api.util.root_pattern(unpack(root_files))(fname)
    local fallback = vim.api.util.root_pattern(unpack(fallback_root_files))(fname)
    return primary or fallback
  end ]]
    -- {
    --     -- Single-module projects
    --     {
    --       'build.xml',           -- Ant
    --       'pom.xml',             -- Maven
    --       'settings.gradle',     -- Gradle
    --       'settings.gradle.kts', -- Gradle
    --     },
    --     -- Multi-module projects
    --     { 'build.gradle', 'build.gradle.kts' },
    --   } or vim.fn.getcwd()
  }

  require 'lspconfig'.lemminx.setup {}

  require 'lspconfig'.pyright.setup {
    on_attach = on_attach,
    update_in_insert = false,
    capabilities = capabilities
  }
end

return { 'neovim/nvim-lspconfig', config = config }
