require("config.lazy")

require("config.options")
require("config.keymaps")
require("config.commands")
require("config.enhancements")

function printAllServers()
  local socket_paths = nil;
  local socket_path_rv = vim.fn.stdpath('run')
  if type(socket_path_rv) == "string" then
    socket_paths = { socket_path_rv }
  else
    socket_paths = socket_path_rv
  end

  for _, curr_instance_socket_path in pairs(socket_paths) do
    local socket_path = vim.fs.dirname(curr_instance_socket_path)

    local sockets = vim.fs.find(
      function() return true end,
      { limit = math.huge, type = 'socket', path = socket_path }
    )

    print(vim.inspect(sockets))
    for x, socket in pairs(sockets) do
      print(socket)
    end
  end
end
