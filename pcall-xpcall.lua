local function readFile(filename)
  local file, err = io.open(filename, "r")
  if not file then
    error("Error opening file: " .. err)
  end
  local content = file:read("*a")
  file:close()
  return content
end


-- Using pcall
local status, content = pcall(readFile, "nonexistent.txt")
if not status then
  print("Caught an error: " .. content)
end

-- Using xpcall with custom error handler
local function errorHandler(err)
  return "Custom error handler: " .. err
end

local status, content = xpcall(function() return readFile("nonexistent.txt") end, errorHandler)
if not status then
  print(content)
end
