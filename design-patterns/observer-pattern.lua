local EventSystem = { observers = {} }

function EventSystem:subscribe(observer)
  table.insert(self.observers, observer)
end

function EventSystem:notify(event)
  for _, observer in ipairs(self.observers) do
    observer(event)
  end
end


local function observer1(event)
  print("Observer 1 received event: " .. event)
end


local function observer2(event)
  print("Observer 2 received event: " .. event)
end

EventSystem:subscribe(observer1)
EventSystem:subscribe(observer2)
EventSystem:notify("Button clicked")
