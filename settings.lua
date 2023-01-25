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
  },
  {
    type          = "bool-setting",
    name          = "wb-rails",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-140"
  },
  {
    type          = "bool-setting",
    name          = "wb-roboports",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-150"
  },
  {
    type          = "bool-setting",
    name          = "wb-radars",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-155"
  },
  {
    type          = "bool-setting",
    name          = "wb-walls",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-160"
  },
  {
    type          = "bool-setting",
    name          = "wb-turrets",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-170"
  },
  {
    type          = "bool-setting",
    name          = "wb-storage",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-180"
  },
  {
    type          = "bool-setting",
    name          = "wb-resource-gathering",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-175"
  },
  {
    type          = "bool-setting",
    name          = "wb-smelting",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-190"
  },
  {
    type          = "bool-setting",
    name          = "wb-crafting",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-200"
  },
  {
    type          = "bool-setting",
    name          = "wb-power",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-210"
  },
  {
    type          = "bool-setting",
    name          = "wb-circuits",
    default_value = false,
    setting_type  = "startup",
    order         = "WB-220"
  }
})
