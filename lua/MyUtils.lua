local socket = require('socket')

PYTHON = "python"
PLUGIN_DIR = debug.getinfo(1).source:sub(2):match('^(.*)/lua/[^/]+$')


function get_available_port()
    local server = assert(socket.bind('*', 0))
    local _, port = server:getsockname(); server:close()
    return port
end
