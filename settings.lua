---------------------------------------------------------------------------
--                          VANILLA SETTINGS                             --
---------------------------------------------------------------------------
data:extend({
  {
    type          = "bool-setting",
    name          = "wb-shallow-water-compatibility",
    default_value = true,
    setting_type  = "startup",
    order         = "WB-050"
  },
  {
    type          = "bool-setting",
    name          = "wb-transport-belts",
    default_value = true,
    setting_type  = "startup",
    order         = "WB-100"
  },
  {
    type          = "bool-setting",
    name          = "wb-electric-poles",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-120"
  },
  {
    type          = "bool-setting",
    name          = "wb-inserters",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-130"
  },
  {
    type          = "bool-setting",
    name          = "wb-pipes",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-110"
  }
})


---------------------------------------------------------------------------
--                       COMPATIBILITY SETTINGS                          --
---------------------------------------------------------------------------
local path_compatibility_scripts = "__water-belts__/" .. "compatibility/"

---------------------------------------------------------------------------