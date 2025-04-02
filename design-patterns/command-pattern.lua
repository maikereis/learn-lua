-- Command interface
local Command = {}
function Command:execute() end
function Command:undo() end

-- Concrete commands

local TypeCommand = {}
function TypeCommand:new(editor, text)
  local obj = {editor = editor, text = text}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function TypeCommand:execute()
  self.editor:write(self.text)
end

function TypeCommand:undo()
  self.editor:delete(#self.text)
end

-- Editor
local Editor = {}
function Editor:new()
  local obj = {content = ""}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Editor:write(text)
  self.content = self.content .. text
end

function Editor:delete(count)
  self.content = self.content:sub(1, #self.content - count)
end

function Editor:getContent()
  return self.content
end

local editor = Editor:new()
local command = TypeCommand:new(editor, "Hello, World!")
command:execute()
print("Inserting: " .. editor:getContent())
command:undo()
print("Undoing: " .. editor:getContent())
