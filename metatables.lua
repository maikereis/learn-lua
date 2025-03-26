local counter = {}

local data = { a = 1, b = 2, c = 3 }
local mt = {
  __index = function(tbl, key)
    counter[key] = (counter[key] or 0) + 1
    return data[key]
  end
}
local tackedData = setmetatable({}, mt)

print(tackedData.a)
print(tackedData.b)
print(tackedData.c)

print("Access counts:")
for k, v in pairs(counter) do
  print(k, v)
end
