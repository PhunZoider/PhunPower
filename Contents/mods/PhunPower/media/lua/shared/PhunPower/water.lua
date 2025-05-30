local Core = PhunPower
local sandbox = SandboxVars
Core.water = {}

Core.water.sprites = {
    ["industry_02_52"] = {}, -- pumps found in util buildings
    ["industry_02_53"] = {}, -- pumps found in util buildings
    ["industry_02_256"] = {}, -- s pipe with turning valve
    ["industry_02_257"] = {}, -- s pipe with turning valve
    ["industry_02_258"] = {}, -- s pipe with turning valve
    ["industry_02_259"] = {} -- s pipe with turning valve
}

function Core.water.getWater()
    return GameTime:getInstance():getNightsSurvived() < sandbox.WaterShutModifier
end

function Core.water.setWater(on)
    local modifier = on and 9999999 or 1
    sandbox.WaterShutModifier = modifier
    getSandboxOptions():getOptionByName("WaterShutModifier"):setValue(modifier)
end
