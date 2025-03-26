function producer()
  for i=1, 5 do
    coroutine.yield("Produced " ..i)
  end
end


function consumer(prod)
  while true do
    local status, value = coroutine.resume(prod)
    if not status or value == nil then break end
    print("Consumed: " .. value)
  end
end


local prod = coroutine.create(producer)
consumer(prod)
