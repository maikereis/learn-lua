local contacts = {}

function addContact(name, phoen, email)
  table.insert(contacts, {name=name, phone=phone, email=email})
end


function removeContact(name)
  for i, contact in ipairs(contacts) do
    if contact.name == name then
      table.remove(contacts, i)
      return true
    end
  end
  return false
end

function searchContact(name)
  for _, contact in ipairs(contacts) do
    if contact.name == name then
      return contact
    end
  end
  return nil
end


addContact("Alice", "123-4567", "alice@example.com")
local result = searchContact("Alice")
if result then
  print("Found contact:" .. result.name)
end
