local M = {}
require("FzfExecute")
require("InternalServer")
require("MyUtils")

local function call(query)
    -- ポートを確定させる
    vim.cmd("let $FZF_PORT = " .. get_available_port())
    vim.cmd("let $SERVER_PORT = " .. get_available_port())

    -- serverを移動する
    local server = InternalServer.new()
    server:start()

    -- fzfのプロセスを開始
    local fzf = FzfExecute.new()
    fzf:start_async(server)
end

M.run = function(query)
    call(query)
end

return M
