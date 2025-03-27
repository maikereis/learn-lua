local json = require("dkjson")

-- Sample data
local data = {
  name = "Alice",
  age = 30,
  hobbies = {"reading", "cycling", "hiking"}
}


-- Serialize to JSON and write to file
local json_string = json.encode(data, {ident = true})
local file = io.open("data.json", "w")
file:write(json_string)
file:close()


-- Read JSON from file and deserialize
local file = io.open("data.json", "r")
local content = file:read("*a")
file:close()
local decode_data = json.decode(content)

print(decode_data.name)
