-- Sorting strategies
local BubbleSort = {}
function BubbleSort:sort(array)
  local n = #array
  local swapped
  repeat
    swapped = false
    for i = 1, n - 1 do
      if array[i] > array[i+1] then
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end
    n = n -1

  until not swapped
end

local InsertionSort = {}
function InsertionSort:sort(array)
  for j = 2, #array do
    local key = array[j]
    local i = j - 1
    while i > 0 and array[i] > key do
      array[i+1] = array[i]
      i = i - 1
    end
    array[i+1] = key
  end
end

-- Context
local SortContext = {}
function SortContext:new(strategy)
  local obj = {strategy = strategy}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function SortContext:setStrategy(strategy)
  self.strategy = strategy
end

function SortContext:executeStrategy(array)
  return self.strategy:sort(array)
end

-- Example usage:
local context = SortContext:new(BubbleSort)
local array = {5, 3, 8, 4, 2, 6}
print("Before sorting:")
for i = 1, #array do
  io.write(array[i], " ")
end

print()

context:executeStrategy(array)
print("Apply BubbleSort strategy:")
for i = 1, #array do
  io.write(array[i], " ")
end

print()
print("Change to InsertionSort strategy: ")
local array = {5, 3, 8, 4, 2, 6}
context:setStrategy(InsertionSort)
context:executeStrategy(array)

print("After sorting:")
for i = 1, #array do
  io.write(array[i], " ")
end

print()
