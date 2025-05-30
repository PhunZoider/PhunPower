if isServer() then
    return
end
local Core = PhunVent

Events.OnPreFillWorldObjectContextMenu.Add(function(playerObj, context, worldobjects, test)
    -- Core.contexts.open(playerObj, context, worldobjects, test)
end)

local function setup()
    Events.OnTick.Remove(setup)
    Core:ini()
    sendClientCommand(Core.name, Core.commands.playerSetup, {})
end

Events.OnTick.Add(setup)
