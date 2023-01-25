local Utils = {}

------------------------------

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


-- rgb to [0,1] range
function Utils.rgb(red, green, blue, alpha)
  return {r = red/255, g = green/255, b = blue/255, a = alpha or 1}
end

-- starts with
function Utils.starts_with(str, start)
  return str:sub(1, #start) == start
end

-- merge tables (overwrite keys)
function Utils.merge(tableIn1, tableIn2)
  for k,v in pairs(tableIn2) do 
    tableIn1[k] = v 
  end
  return tableIn2
end

-- split by delimiter
function Utils.split(str, delimiter)
  local splits = {}
  for word in string.gmatch(str, '([^'.. delimiter .. ']+)') do
    table.insert(splits, word)
  end
  return splits
end

-- GCD, Greatest Common Divisor
function Utils.gcd(a, b)
  if type(a) == "number" and type(b) == "number" and a == math.floor(a) and b == math.floor(b) then
    if b == 0 then
      return a
    else
      return Utils.gcd(b, a % b) -- tail recursion
    end
  else
    error("Invalid argument to gcd (" .. tostring(a) .. "," .. tostring(b) .. ")", 2)
  end
end

-- #table
function Utils.table_size(tbl)
  local count = 0
  for k, v in pairs(tbl) do
      count = count + 1
  end
  return count
end

-- string, number
function Utils.multiplyStringValue(text, coefficient)
  local n = string.match(text, "%d+")
  local s = string.match(text, "%a+")
  return tostring(tonumber(n) * coefficient) .. s
end

------------------------------

return Utils