PhunPower = {
    name = "PhunPower",
    events = {
        onReady = "OnPhunPowerReady"
    },
    consts = {},
    commands = {
        playerSetup = "playerSetup",
        toggleWater = "toggleWater",
        togglePower = "togglePower",
        setWater = "setWater",
        setPower = "setPower",
        breakWater = "breakWater",
        breakPower = "breakPower",
        fixWater = "fixWater",
        fixPower = "fixPower"
    }
}

local Core = PhunPower

Core.settings = SandboxVars[Core.name] or {}
for _, event in pairs(Core.events or {}) do
    if not Events[event] then
        LuaEventManager.AddEvent(event)
    end
end

function Core:ini()
    if not self.inied then
        self.inied = true

        if (not isClient() and not isServer() and not isCoopHost()) or isServer() then
            -- single player or a server so load changes from file
            print(self.name .. ": Loading changes as server")

        elseif not isServer() then
            print(self.name .. ": Loading changes as client")
            -- client so use cached version and then ask server for its changes

        end
        print(self.name .. " Triggering OnReady")
        triggerEvent(self.events.OnPhunZoneReady)
    end
end
