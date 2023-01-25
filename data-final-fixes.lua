---------------------------------------------------------------------------
-- -- Function import
---------------------------------------------------------------------------

local CollisionMaskUtil = require("collision-mask-util")
local insert = table.insert
local wbmu = wb.mask_util
local wbdu = wb.data_util
local startup           = wbdu.getStartupSettingByKey
local applyToEntity     = wbdu.applyToChildren
local applyToFiltEntity = wbdu.applyToFilteredChildren

---------------------------------------------------------------------------

local firstUnUsedLayer = CollisionMaskUtil.get_first_unused_layer()
wb.debug.log("First layer: " .. firstUnUsedLayer)

local whitelist_NOT_layers = {}   -- item-layer, player-layer, water-tile
local whitelist_XOR_layers = {}   -- item-layer, player-layer, water-tile, 1st unused
local whitelist_shallow_water_tile = {}   -- remove layers: item-layer, player-layer 

---------------------------------------------------------------------------
-- -- Load sartup settings
---------------------------------------------------------------------------

if startup("wb-shallow-water-compatibility") then
  -- Shallow water 1-2
  -- fixes layer mask to behave like water but being walkable still
  insert(whitelist_shallow_water_tile, "water-shallow")
  insert(whitelist_shallow_water_tile, "water-mud")
end

if startup("wb-transport-belts") then
  insert(whitelist_NOT_layers, "transport-belt")
  insert(whitelist_NOT_layers, "underground-belt")
  insert(whitelist_NOT_layers, "splitter")
  insert(whitelist_NOT_layers, "loader")
end

if startup("wb-pipes") then
  insert(whitelist_XOR_layers, "pipe")
  insert(whitelist_XOR_layers, "pipe-to-ground")
  insert(whitelist_XOR_layers, "pump")
end

if startup("wb-inserters") then
  insert(whitelist_XOR_layers, "inserter")
end

if startup("wb-electric-poles") then
  insert(whitelist_XOR_layers, "electric-pole")
end

if startup("wb-rails") then
  insert(whitelist_NOT_layers, "rail-signal")
  insert(whitelist_NOT_layers, "rail-chain-signal")
  insert(whitelist_NOT_layers, "straight-rail")
  insert(whitelist_NOT_layers, "curved-rail")
  insert(whitelist_XOR_layers, "train-stop")
end

if startup("wb-roboports") then
  insert(whitelist_XOR_layers, "roboport")
end

if startup("wb-radars") then
  insert(whitelist_XOR_layers, "radar")
end

if startup("wb-walls") then
  insert(whitelist_XOR_layers, "wall")
  insert(whitelist_XOR_layers, "gate")
end

if startup("wb-storage") then
  insert(whitelist_XOR_layers, "storage-tank")
  insert(whitelist_XOR_layers, "container")
  insert(whitelist_XOR_layers, "logistic-container")
end

if startup("wb-resource-gathering") then
  insert(whitelist_XOR_layers, "mining-drill")
end

if startup("wb-smelting") then
  insert(whitelist_XOR_layers, "furnace")
end

if startup("wb-power") then
  insert(whitelist_XOR_layers, "accumulator")
  insert(whitelist_XOR_layers, "generator")
  insert(whitelist_XOR_layers, "boiler")
  insert(whitelist_XOR_layers, "burner-generator")
  insert(whitelist_NOT_layers, "heat-pipe")
  insert(whitelist_XOR_layers, "offshore-pump")
  insert(whitelist_XOR_layers, "lamp")
  insert(whitelist_XOR_layers, "reactor")
  insert(whitelist_XOR_layers, "solar-panel")
end

if startup("wb-circuits") then
  insert(whitelist_XOR_layers, "arithmetic-combinator")
  insert(whitelist_XOR_layers, "constant-combinator")
  insert(whitelist_XOR_layers, "decider-combinator")
  insert(whitelist_XOR_layers, "programmable-speaker")
  insert(whitelist_XOR_layers, "power-switch")
end

---------------------------------------------------------------------------
-- -- Add compatibility conditions
---------------------------------------------------------------------------


---------------------------------------------------------------------------
-- -- Apply changes
---------------------------------------------------------------------------

applyToFiltEntity(
  wbmu.removeLayersFromCollisionMask, 
  "tile",
  whitelist_shallow_water_tile,
  {
    "item-layer",
    "object-layer",
    "player-layer"
  }
)

applyToFiltEntity(
  wbmu.addLayersToCollisionMask, 
  "tile",
  whitelist_shallow_water_tile,
  {
    "water-tile",
    --"item-layer",
    "resource-layer",
    --"player-layer",
    "doodad-layer"
  }
)  

for ___, source in pairs(whitelist_NOT_layers) do
  applyToEntity(
    wbmu.removeLayersFromCollisionMask,
    source,
    {
      "item-layer",
      "player-layer",
      "water-tile"
    }
  )
end

for ___, source in pairs(whitelist_XOR_layers) do
  applyToEntity(
    wbmu.removeLayersFromCollisionMask,
    source,
    {
      "item-layer",
      "player-layer",
      "water-tile"
    }
  )
end

for ___, source in pairs(whitelist_XOR_layers) do
  applyToEntity(
    wbmu.addLayerToCollisionMask,
    source,
    firstUnUsedLayer
  )
end

wbmu.addLayerToCollisionMask(data.raw["character"]["character"], firstUnUsedLayer)

