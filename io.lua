-- Writing to a file
local file = io.open("names.txt", "w")
file:write("Alice\nBob\nCharlie\n")
file:close()


-- Reading from a file
local file = io.open("names.txt", "r")
for line in file:lines() do
  print(line)
end
file:close()
