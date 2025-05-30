if isServer() then
    return
end
local Core = PhunVent

Core.contexts = {}

Core.contexts.open = function(player, context, worldobjects, test)

    local square
    local isPower = false
    local isWater = false
    for _, wObj in ipairs(worldobjects) do -- find object to interact with; code support for controllers
        square = wObj:getSquare()
        local md = square and square:getModData() or nil
        if md and md.PhunPowa then
            isPower = md.PhunPowa.power == true
            isWater = md.PhunPowa.water == true
            break
        end
    end

    if isAdmin() or isDebugEnabled() then

        local adminOption = context:addOption("PhunVent " .. (isPower and " - POWER " or "") ..
                                                  (isWater and " - Water" or ""), worldobjects, nil)
        local adminSubMenu = ISContextMenu:getNew(context)

        adminSubMenu:addOption("Toggle Power ", player, function()
            sendClientCommand(Core.name, Core.commands.togglePower, {})
        end)

        adminSubMenu:addOption("Toggle Water ", player, function()
            sendClientCommand(Core.name, Core.commands.toggleWater, {})
        end)

        local breakPower = adminSubMenu:addOption("Break Power", player, function()
            sendClientCommand(Core.name, Core.commands.setPower, {tostring(not isPower)})
        end)

        local fixPower = adminSubMenu:addOption("Fix Power", player, function()
            sendClientCommand(Core.name, Core.commands.setPower, {tostring(not isPower)})
        end)

        local breakWater = adminSubMenu:addOption("Break Water", player, function()
            sendClientCommand(Core.name, Core.commands.setWater, {tostring(not isWater)})
        end)

        local fixWater = adminSubMenu:addOption("Fix Water", player, function()
            sendClientCommand(Core.name, Core.commands.setWater, {tostring(not isWater)})
        end)

        context:addSubMenu(adminOption, adminSubMenu)
    end
end
