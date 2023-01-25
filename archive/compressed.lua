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
  setRawCollisionMask("pump",               wb.masks.default)
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

-- Storage
if settings.startup["wb-storage"].value then
  setRawCollisionMask("storage-tank",       wb.masks.default)
  setRawCollisionMask("container",          wb.masks.default)
  setRawCollisionMask("logistic-container", wb.masks.default)
end

-- Resources
if settings.startup["wb-resource-gathering"].value then
  setRawCollisionMask("mining-drill",       wb.masks.default)
end

-- Smelting
if settings.startup["wb-smelting"].value then
  setRawCollisionMask("furnace",            wb.masks.default)
end

-- Crafting
if settings.startup["wb-crafting"].value then
  setRawCollisionMask("assembling-machine", wb.masks.default)
  setRawCollisionMask("beacon",             wb.masks.default)
  setRawCollisionMask("lab",                wb.masks.default)
end

-- Power
if settings.startup["wb-power"].value then
  setRawCollisionMask("accumulator",        wb.masks.default)
  setRawCollisionMask("generator",          wb.masks.default)
  setRawCollisionMask("boiler",             wb.masks.default)
  setRawCollisionMask("burner-generator",   wb.masks.default)
  setRawCollisionMask("heat-pipe",          wb.masks.heat)
  setRawCollisionMask("offshore-pump",      wb.masks.default)
  setRawCollisionMask("lamp",               wb.masks.default)
  setRawCollisionMask("reactor",            wb.masks.default)
  setRawCollisionMask("solar-panel",        wb.masks.default)
end

-- Circuits
if settings.startup["wb-circuits"].value then
  setRawCollisionMask("arithmetic-combinator", wb.masks.default)
  setRawCollisionMask("constant-combinator",   wb.masks.default)
  setRawCollisionMask("decider-combinator",    wb.masks.default)
  setRawCollisionMask("programmable-speaker",  wb.masks.default)
  setRawCollisionMask("power-switch",          wb.masks.default)
end

-- ? electric-energy-interface 
-- ? heat-interface
