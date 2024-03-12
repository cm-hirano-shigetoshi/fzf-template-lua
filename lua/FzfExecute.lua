local fzf = require("fzf")

require("fzf").default_options = {
    window_on_create = function()
        vim.cmd("set winhl=Normal:Normal")
    end
}

function start_fzf(port)
    coroutine.wrap(function()
        local result = fzf.fzf("date", "--multi --listen " .. port)
        if result then
            print(result)
        end
    end)()
end
