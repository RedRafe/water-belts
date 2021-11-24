wb.stage = "data-final-fixes"

-- Shallow water 1-2
-- fixes layer mask to behave like water but being walkable still
if settings.startup["wb-shallow-water-compatibility"].value then
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
end

-- Additional settings
if settings.startup["wb-transport-belts"].value then 
  setRawCollisionMask("transport-belt",   wb.masks.transport)
  setRawCollisionMask("underground-belt", wb.masks.exception)
  setRawCollisionMask("splitter",         wb.masks.exception)
  setRawCollisionMask("loader",           wb.masks.exception)
end
if settings.startup["wb-pipes"].value then 
  setRawCollisionMask("pipe",           wb.masks.exception)
  setRawCollisionMask("pipe-to-ground", wb.masks.exception)  
end
if settings.startup["wb-inserters"].value then 
  setRawCollisionMask("inserter",       wb.masks.exception)
end
if settings.startup["wb-electric-poles"].value then 
  setRawCollisionMask("electric-pole",  wb.masks.exception)
end
