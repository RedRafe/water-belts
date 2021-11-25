wb.stage = "data-final-fixes"

-- Shallow water 1-2
-- fixes layer mask to behave like water but being walkable still
if settings.startup["wb-shallow-water-compatibility"].value then
  data.raw.tile["water-shallow"].collision_mask = {
    "water-tile",
    --"item-layer",
    "resource-layer",
    --"player-layer",
    "doodad-layer"
  }
  data.raw.tile["water-mud"].collision_mask = {
    "water-tile",
    --"item-layer",
    "resource-layer",
    --"player-layer",
    "doodad-layer"
  }
end

-- Belts, Underground, Splitters and Loaders
if settings.startup["wb-transport-belts"].value then 
  setRawCollisionMask("transport-belt",     wb.masks.transport)
  setRawCollisionMask("underground-belt",   wb.masks.exception)
  setRawCollisionMask("splitter",           wb.masks.exception)
  setRawCollisionMask("loader",             wb.masks.exception)
end

-- Pipes and Underground pipes
if settings.startup["wb-pipes"].value then 
  setRawCollisionMask("pipe",               wb.masks.default)
  setRawCollisionMask("pipe-to-ground",     wb.masks.default)  
end

-- Inserters
if settings.startup["wb-inserters"].value then 
  setRawCollisionMask("inserter",           wb.masks.default)
end

-- Small, Medium & Big Poles, Substations
if settings.startup["wb-electric-poles"].value then 
  setRawCollisionMask("electric-pole",      wb.masks.default)
end

-- Rails, Signals, Stations
if settings.startup["wb-rails"].value then
  setRawCollisionMask("rail-signal",        wb.masks["rail-signal-base"])
  setRawCollisionMask("rail-chain-signal",  wb.masks["rail-signal-base"])
  setRawCollisionMask("straight-rail",      wb.masks.rail)
  setRawCollisionMask("curved-rail",        wb.masks.rail)
  setRawCollisionMask("train-stop",         wb.masks.default)
end

-- Roboports
if settings.startup["wb-roboports"].value then
  setRawCollisionMask("roboport",           wb.masks.default)
end

-- Radars
if settings.startup["wb-radars"].value then
  setRawCollisionMask("radar",              wb.masks.default)
end

-- Walls and Gates
if settings.startup["wb-walls"].value then
  setRawCollisionMask("wall",               wb.masks.default)
  setRawCollisionMask("gate",               wb.masks.gate)
end

-- Turrets (Gun, Flame, Laser, Artillery)
if settings.startup["wb-turrets"].value then
  setRawCollisionMask("ammo-turret",        wb.masks.default)
  setRawCollisionMask("fluid-turret",       wb.masks.default)
  setRawCollisionMask("electric-turret",    wb.masks.default)
  setRawCollisionMask("artillery-turret",   wb.masks.default)
end