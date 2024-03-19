InternalServer = {}
InternalServer.__index = InternalServer

function InternalServer.new()
    local self = setmetatable({}, InternalServer)
    self.pid = nil
    return self
end

function InternalServer:start()
    _, self.pid = vim.loop.spawn("python", {
        args = { "server.py" }
    }, function()
    end)
end

function InternalServer:stop()
    os.execute("kill " .. self.pid)
end
