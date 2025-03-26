local Logger = {}
local instance = nil


function Logger:new()
  if instance then return instance end
  local obj = { logs = {} }
  setmetatable(obj, self)
  self.__index = self
  instance = obj
  return instance
end

function Logger:log(message)
  local timestamp = os.date("%Y-%m-%d %H:%M:%S")
  table.insert(self.logs, timestamp .. ": " .. message)
  print(timestamp .. ": " .. message)
end


local logger1 = Logger:new()
logger1:log("First log entry")
local logger2 = Logger.new()
logger2:log("Second log entry")
print(logger1 == logger2)
