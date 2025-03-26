function safeDivide(a, b)
  if b == 0 then
    return "Error: Cannot divide by zero"
  else
    return a / b
  end
end

print(safeDivide(10, 2))
print(safeDivide(10, 0))
