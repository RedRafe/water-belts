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
wb.masks = {
  ["default"]     = {"object-layer", "player-layer"},
  ["exception"]   = {"object-layer", "transport-belt-layer"},
  ["transport"]   = {"object-layer", "floor-layer", "transport-belt-layer"}
}

data.raw.tile["water-shallow"].collision_mask = {
  "water-tile",
  "item-layer",
  "resource-layer",
  --"player-layer",
  "doodad-layer"
}
data.raw.tile["water-mud"].collision_mask = {
  "water-tile",
  "item-layer",
  "resource-layer",
  --"player-layer",
  "doodad-layer"
}