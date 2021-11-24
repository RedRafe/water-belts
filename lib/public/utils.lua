local Utils = {}

-- merge tables (overwrite keys)
function Utils.mergeTable(tableIn1, tableIn2)
  for k,v in pairs(tableIn2) do 
    tableIn1[k] = v 
  end
  return tableIn1
end

-- filter table
function Utils.filterTable(tableIn, excludeValue)
  local tmp = {}
  for _, tableValue in pairs(tableIn) do
      if tableValue ~= excludeValue then
        table.insert(tmp, tableValue)
      end
  end
  return tmp
end

-- #table
function Utils.tableSize(tableIn)
  local count = 0
  for _, v in pairs(tableIn) do
      count = count + 1
  end
  return count
end

-- get boolean startup setting
function Utils.startup(key)
  return settings.startup[key].value and 1 or 0
end

return Utils