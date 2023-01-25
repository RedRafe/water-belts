---------------------------------------------------------------------------
-- -- -- PRE INITIALIZATION
---------------------------------------------------------------------------
-- Mod Info
wb                               = {} 
wb.internal_name                 = "water-belts"
wb.title_name                    = "Water Belts"
wb.base                          = "__water-belts__/"
wb.stage                         = "data"

-- -- Global Mod paths
require(wb.base     .. "lib/paths")
require(wb_path_lib .. "debugger")

---------------------------------------------------------------------------
-- -- -- CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------
--EXCLUDE layers: water-tile, item-layer
local collision_mask_util = require("collision-mask-util")
local fist_unused_layer = collision_mask_util.get_first_unused_layer()

wb.masks = {
  ["character"] = {"player-layer", "train-layer", "consider-tile-transitions", fist_unused_layer},
  ["default"]   = {"object-layer", fist_unused_layer}, --"item-layer"
  ["exception"] = {"object-layer", "transport-belt-layer"}, --"item-layer"
  ["transport"] = {"object-layer", "floor-layer", "transport-belt-layer"},
  ["rail"]      = {"object-layer", "rail-layer", "floor-layer"}, --"item-layer"
  ["signal"]    = {"floor-layer", "rail-layer"}, --"item-layer"
  ["gate"]      = {"object-layer", "train-layer", fist_unused_layer}, --"item-layer"
  ["heat"]      = {"object-layer", "floor-layer"}
}

if data.raw.character.character.collision_mask then
  collision_mask_util.add_layer(data.raw.character.character.collision_mask, wb.masks.character)
else
  setCollisionMask("character", "character", wb.masks.character)
end
