-- @ tableIn: Table
-- @ element: any
local function tableContains(tableIn, element)
  for ___, value in pairs(tableIn) do
    if value == element then
      return true
    end
  end
  return false
end

-- @ tableIn: Table
-- @ element: string
local function tableRemove(tableIn, element)
  for k, v in pairs(tableIn) do -- ipairs can also be used instead of pairs
    if v == element then
        tableIn[k] = nil
        break
    end
  end
end

-- @ parent: String
local function isParentValid(parent)
  return (data.raw[parent] ~= nil)
end

-- @ parent children: String
local function isChildrenValid(parent, children)
  return (data.raw[parent][children] ~= nil)
end

-- @ parent: String
local function getChildren(parent)
  if not isParentValid(parent) then return {} end
  local children = {}
  for child, value in pairs(data.raw[parent]) do
    if isChildrenValid(parent, child) then
      table.insert(children, child)
    end
  end
  return children
end

-- @ method: Function of [1-2] args
-- @ parent: String
-- @ (optional) args: any, nil
local function applyToChildren(method, parent, args)
  if not isParentValid(parent) then
    wb.debug.log("Error: ".. parent .. " not found as source")
    return
  end
  if args ~= nil then
    for ___, children in pairs(data.raw[parent]) do
      if children ~= nil then
        method(children, args)
      end
    end
  else
    for ___, children in pairs(data.raw[parent]) do
      if children ~= nil then
        method(children)
      end
    end
  end
end

-- @ method: Function of [1-2] args
-- @ parent: String
-- @ filterTable: Table<String>
-- @ (optional) args: any, nil
local function applyToFilteredChildren(method, parent, filterTable, args)
  if not isParentValid(parent) then
    wb.debug.log("Error: " .. " not found as source")
    return
  end
  if args ~= nil then
    for ___, children in pairs(data.raw[parent]) do
      if (children ~= nil) and (tableContains(filterTable, children.name)) then
        method(children, args)
      end
    end
  else
    for ___, children in pairs(data.raw[parent]) do
      if (children ~= nil) and (tableContains(filterTable, children.name)) then
        method(children)
      end
    end
  end
end

-- @ key: String
local function getStartupSettingByKey(key)
  return settings.startup[key].value
end

------------

if not wb.data_util then wb.data_util = {} end

wb.data_util.tableRemove             = tableRemove
wb.data_util.getChildren             = getChildren
wb.data_util.getStartupSettingByKey  = getStartupSettingByKey
wb.data_util.applyToChildren         = applyToChildren
wb.data_util.applyToFilteredChildren = applyToFilteredChildren
