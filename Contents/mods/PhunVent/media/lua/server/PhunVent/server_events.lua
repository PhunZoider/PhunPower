if isClient() then
    return
end
local Core = PhunVent
local Commands = require "PhunVent/server_commands"

Events.OnClientCommand.Add(function(module, command, playerObj, arguments)
    if module == Core.name then
        if Commands[command] then
            Commands[command](playerObj, arguments)
        end
    end
end)
Events.LoadGridsquare.Add(function(square)
    -- Core.tryRegisterSquare(square)
end)
