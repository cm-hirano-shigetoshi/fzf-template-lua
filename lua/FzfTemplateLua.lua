local M = {}
require("FzfExecute")
require("InternalServer")
require("MyUtils")

local function call(query)
    local server_port = InternalServer:new()
    local fzf_port = get_available_port()
    start_fzf(fzf_port)
end

M.run = function(query)
    call(query)
end

return M
