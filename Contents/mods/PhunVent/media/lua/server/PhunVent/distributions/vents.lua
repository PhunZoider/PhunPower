local overlayMap = {}
overlayMap.VERSION = 1

local southFacing = {"walls_commercial_01_48", "walls_interior_house_02_20", "walls_interior_house_02_38",
                     "walls_interior_house_02_49", "walls_interior_house_03_22"}

local eastFacing = {"walls_commercial_01_49", "walls_interior_house_02_21", "walls_interior_house_02_49",
                    "walls_interior_house_02_36", "walls_interior_house_03_20"}

for k, v in ipairs(southFacing) do
    overlayMap[v] = {{
        name = "other",
        chance = 11,
        usage = "",
        tiles = {"phunvent_01_0"}
    }}
end

for k, v in ipairs(eastFacing) do
    overlayMap[v] = {{
        name = "other",
        chance = 11,
        usage = "",
        tiles = {"phunvent_01_1"}
    }}
end

if not TILEZED then
    getTileOverlays():addOverlays(overlayMap)
end
print("==========================")
print("PhunVent: Loaded overlays!")
print("==========================")
return overlayMap
