---------------------------------------------------------------------------
-- -- -- PRE INITIALIZATION
---------------------------------------------------------------------------
-- General Info
wb                               = {} 
wb.internal_name                 = "water-belts"
wb.title_name                    = "Water Belts"
wb.version                       = mods[wb.internal_name]
wb.stage                         = "data"

-- -- Global Mod paths
require("__" .. wb.internal_name .. "__/lib/public/paths")
require(path_private_lib .. "entity-behaviour")

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
  ["gate"]      = {"object-layer", "train-layer", fist_unused_layer} --"item-layer"
}

if data.raw.character.character.collision_mask then
  collision_mask_util.add_layer(data.raw.character.character.collision_mask, wb.masks.character)
else
  setCollisionMask("character", "character", wb.masks.character)
end
