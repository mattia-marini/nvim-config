require("runner").config({
  c = {
    buildAndRun = function(args)
      return "make"
    end
  },
  javascript = {
    userArgs = function()
      local root = vim.fs.root(0, { 'package.json', 'node_modules', '.git' })
      local srcDir

      if root then
        for name, type in vim.fs.dir(root) do
          if name == "src" and type == "directory" then srcDir = name end
        end
      end

      if srcDir then srcDir = vim.fs.joinpath(root, "/src") end
      return { root = srcDir or root }
    end,
    buildAndRun = function(args)
      if args.user.root then
        return "DT && npm start"
      else
        return "cd " .. args.default.currFileDir .. " && node " .. args.default.currFileName .. args.default.args
      end
    end
  },
  rust = {
    buildAndRun = function(args)
      return "cargo run"
    end
  }
})
