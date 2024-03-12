local M = {}
local fzf = require("fzf")

require("fzf").default_options = {
    window_on_create = function()
        vim.cmd("set winhl=Normal:Normal")
    end
}

local function execute_fzf()
    coroutine.wrap(function()
        local result = fzf.fzf("date", "--multi")
        if result then
            print(result)
        end
    end)()
end

local function call(query)
    execute_fzf()
end

M.run = function(query)
    call(query)
end

return M
