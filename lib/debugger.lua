if not wb.debug then wb.debug = {} end
wb.debug.state = false

local function print_debug_message(message)
  if wb.debug.state == true then
    log(message)
  end
end

wb.debug.log = print_debug_message