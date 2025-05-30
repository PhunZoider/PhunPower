if isClient() then
    return
end
local Core = PhunPower

function Core.getGlobalData()
    local data = ModData.getOrCreate(self.name)
    if data == nil then
        data = {}
        getWorld():getModData().PhunPowa = data
    end
    return data
end

function Core.tryRegisterSquare(square)

    if not square then
        return
    end
    local md = square:getModData().PhunPowa or nil
    if md ~= nil then
        return
    end
    md = {}
    for i = 0, square:getObjects():size() - 1 do
        local obj = square:getObjects():get(i)
        local name = obj:getSprite():getName()
        if Core.water.sprites[name] ~= nil then
            md = {
                water = true
            }
            print("Water found in square at " .. square:getX() .. "," .. square:getY())
            square:getModData().PhunPowa = md

            return
        elseif Core.power.sprites[name] ~= nil then
            md = {
                power = true
            }
            print("Power found in square at " .. square:getX() .. "," .. square:getY())
            square:getModData().PhunPowa = md
            return
        end
    end

end
