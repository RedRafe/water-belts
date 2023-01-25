---------------------------------------------------------------------------
-- -- -- INITIALIZATION
---------------------------------------------------------------------------
-- Mod Info
wb                               = {} 
wb.internal_name                 = "water-belts"
wb.title_name                    = "Water Belts"
wb.base                          = "__water-belts__/"
wb.stage                         = "data"

-- Modules
require(wb.base     .. "lib/paths")
require(wb_path_lib .. "debugger")
require(wb_path_lib .. "data-util")
require(wb_path_lib .. "mask-util")