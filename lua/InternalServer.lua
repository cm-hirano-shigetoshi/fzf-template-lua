InternalServer = {}
require("MyUtils")

SERVER_PID = -1
PYTHON = "python"
PLUGIN_DIR = debug.getinfo(1).source:sub(2):match('^(.*)/lua/[^/]+$')
CURL = "curl"


function InternalServer:new()
    if SERVER_PID >= 0 then
        os.execute("kill " .. SERVER_PID)
    end
    local server_port = get_available_port()
    local _, pid = vim.loop.spawn(PYTHON, {
        args = { PLUGIN_DIR .. "/python/internal_server.py", ".", server_port },
        stdio = { stdout, stderr } -- stdout, stderrといったオプション設定
    }, function()
    end)
    SERVER_PID = pid
    return server_port
end
