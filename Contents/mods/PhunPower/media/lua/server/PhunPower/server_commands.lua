if isClient() then
    return
end

local Core = PhunPower
local Commands = {}

Commands[Core.commands.toggleWater] = function(playerObj, arguments)
    Core.water.setWater(not Core.water.getWater())
end

Commands[Core.commands.setWater] = function(playerObj, arguments)
    Core.water.setWater(arguments[1] == "true")
end

Commands[Core.commands.togglePower] = function(playerObj, arguments)
    Core.power.setPower(not Core.power.getPower())
end

Commands[Core.commands.setPower] = function(playerObj, arguments)
    Core.power.setPower(arguments[1] == "true")
end

Commands[Core.commands.breakWater] = function(playerObj, arguments)
    Core.water.setWater(false)
end

Commands[Core.commands.breakPower] = function(playerObj, arguments)
    Core.power.setPower(false)
end

Commands[Core.commands.fixWater] = function(playerObj, arguments)
    Core.water.setWater(true)
end

Commands[Core.commands.fixPower] = function(playerObj, arguments)
    Core.power.setPower(true)
end

return Commands
