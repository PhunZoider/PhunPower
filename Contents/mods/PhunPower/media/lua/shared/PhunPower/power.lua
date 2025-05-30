local Core = PhunPower
local sandbox = SandboxVars
Core.power = {}

Core.power.sprites = {
    ["industry_02_176"] = {}, -- s side of building utils
    ["industry_02_177"] = {}, -- e side of building utils
    ["industry_02_178"] = {}, -- w side of building utils
    ["industry_02_179"] = {}, -- n side of building utils
    ["industry_02_180"] = {}, -- s side of building utils
    ["industry_02_181"] = {}, -- e side of building utils
    ["industry_02_182"] = {}, -- w side of building utils
    ["industry_02_183"] = {}, -- n side of building utils
    ["industry_02_164"] = {}, -- se corner - big thing
    ["industry_02_163"] = {}, -- e facing cabinet
    ["industry_02_170"] = {}, -- s facing cabinet
    ["industry_02_62"] = {} -- s facing yellow cabinet
}

function Core.power.getPower()
    return GameTime:getInstance():getNightsSurvived() < sandbox.ElecShutModifier
end

function Core.power.hasPower(square)
    if square and sandbox.ElecShutModifier > -1 then
        return square:haveElectricity() or GameTime:getInstance():getNightsSurvived() >
                   getSandboxOptions():getOptionByName("ElecShutModifier"):getValue()
    end
    return false
end

function Core.power.setPower(on)
    local modifier = on and 9999999 or 1
    sandbox.ElecShutModifier = modifier
    getSandboxOptions():getOptionByName("ElecShutModifier"):setValue(modifier)
end

function Core.power.breakPower(value, x, y, z)
    local square = getWorld():getCell():getGridSquare(x, y, z)
    if square then
        local md = square:getModData().PhunPowa or nil
        if md and md.power ~= nil then
            md.broken = value
            return true
        end
    end
    return false
end

function Core.power.countOfBroken()
    local count = 0

    for _, square in ipairs(getWorld():getCell():getAllSquares()) do
        local md = square:getModData().PhunPowa or nil
        if md and md.broken then
            count = count + 1
        end
    end
    return count
end

