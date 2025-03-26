function add(a, b)
  return a + b
end 

function subtract(a, b)
  return a - b
end

function multiply(a, b)
  return a * b
end

function divide(a, b)
  if b~=0 then
    return a/b
  else
    return "Error: Division by zero"
  end
end

print("addition: " .. add(4,2))
print("subtraction: " .. subtract(3, 1))
print("divide by 0: " ..divide(2,0))
print("divide: " ..divide(10, 5))
