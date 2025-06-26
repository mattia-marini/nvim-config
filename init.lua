require("config.lazy")

require("config.options")
require("config.keymaps")
require("config.commands")
require("config.enhancements")

function get_config_location(tool)
  -- Fish config directory
  if tool == "fish" then
    local job = vim.system(
      { 'fish', '-c', 'echo SILKNVIMSEPSTART1234567890{$__fish_config_dir}SILKNVIMSEPEND1234567890' },
      { text = true }):wait()

    if not (job.code == 0 and #job.stdout > 0) then
      vim.notify("Could not get $__fish_config_dir", vim.log.levels.ERROR)
      return nil
    else
      local cleared_path = job.stdout:match("SILKNVIMSEPSTART1234567890(.-)SILKNVIMSEPEND1234567890")
      return vim.fs.joinpath(cleared_path, "themes")
    end

    -- Kitty config directory
  elseif tool == "kitty" then
    if os.getenv("KITTY_CONFIG_DIRECTORY") then
      return os.getenv("KITTY_CONFIG_DIRECTORY")
    elseif os.getenv("XDG_CONFIG_HOME") then
      return vim.fs.joinpath(os.getenv("XDG_CONFIG_HOME"), "kitty", "themes")
    else
      return vim.fn.expand("~/.config/kitty/themes")
    end

    -- Starship config file
  elseif tool == "starship" then
    if os.getenv("$STARSHIP_CONFIG") then
      return os.getenv("$STARSHIP_CONFIG")
    else
      return vim.fn.expand("~/.config/starship.toml")
    end
  end
end

-- function notify(servername)
--   print("Sending rpc notification")
--   local channel_id = vim.fn.sockconnect('pipe', servername, { rpc = 1 })
--   print(channel_id)
--
--   vim.rpcnotify(0, "nvim_command", ":echo 'hello_from_rpcnotify'")
--   -- vim.rpcrequest(channel_id, "nvim_command", ":echo 'hello_rpc'")
--   -- vim.fn.chanclose(channel_id)
--
--   -- vim.rpcnotify(channel_id, "ColorScheme")
--   -- vim.rpcrequest(channel_id, "nvim_command", "echo hello_rpc")
--   -- vim.schedule(
--   --   function()
--   --     -- vim.rpcrequest(channel_id, "nvim_command", ":echo hello_rpc")
--   --     -- vim.rpcnotify(channel_id, "nvim_command", ":echo hello_rpc")
--   --     -- vim.fn.chanclose(channel_id)
--   --   end
--   -- )
-- end
--
-- function servername()
--   print(vim.v.servername)
-- end
--
-- function get_socket_paths()
--   local sockets = vim.fn.stdpath("run")
--   local std_sockets_paths = {}
--   if type(sockets) == "string" then
--     table.insert(std_sockets_paths, sockets)
--   else
--     std_sockets_paths = sockets
--   end
--
--   for _, socket in ipairs(std_sockets_paths) do
--     print(socket)
--   end
--
--
--
--   -- local sockets_path = vim.fs.dir()
--   -- for _, socket in ipairs(sockets) do
--   --   print(socket)
--   -- end
-- end
--
-- function write_cache()
--   local sockets = vim.fn.stdpath("run")
-- end

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     print("Colorscheme event")
--   end,
-- })
