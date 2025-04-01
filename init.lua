require("config.lazy")

require("config.options")
require("config.keymaps")
require("config.commands")
require("config.enhancements")

function notify(servername)
  print("Sending rpc notification")
  local channel_id = vim.fn.sockconnect('pipe', servername, { rpc = 1 })
  print(channel_id)

  vim.rpcnotify(0, "nvim_command", ":echo 'hello_from_rpcnotify'")
  -- vim.rpcrequest(channel_id, "nvim_command", ":echo 'hello_rpc'")
  -- vim.fn.chanclose(channel_id)

  -- vim.rpcnotify(channel_id, "ColorScheme")
  -- vim.rpcrequest(channel_id, "nvim_command", "echo hello_rpc")
  -- vim.schedule(
  --   function()
  --     -- vim.rpcrequest(channel_id, "nvim_command", ":echo hello_rpc")
  --     -- vim.rpcnotify(channel_id, "nvim_command", ":echo hello_rpc")
  --     -- vim.fn.chanclose(channel_id)
  --   end
  -- )
end

function servername()
  print(vim.v.servername)
end

function get_socket_paths()
  local sockets = vim.fn.stdpath("run")
  local std_sockets_paths = {}
  if type(sockets) == "string" then
    table.insert(std_sockets_paths, sockets)
  else
    std_sockets_paths = sockets
  end

  for _, socket in ipairs(std_sockets_paths) do
    print(socket)
  end



  -- local sockets_path = vim.fs.dir()
  -- for _, socket in ipairs(sockets) do
  --   print(socket)
  -- end
end

function write_cache()
  local sockets = vim.fn.stdpath("run")
end

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     print("Colorscheme event")
--   end,
-- })
