local ShapeFactory = {}

function ShapeFactory.createShape(shapeType, dimensions)
  if shapeType == "circle" then
    local circle = {
      radius = dimensions.radius,
      area = function(self) return math.pi * self.radius^2 end,
      perimeter = function(self) return 2 * math.pi * self.radius end
    }
    return circle
  elseif shapeType == "rectangle" then
    local rectangle = {
      width = dimensions.width,
      height = dimensions.height,
      area = function(self) return self.width * self.height end,
      perimeter = function(self) return 2 * (self.width + self.height) end
    }
    return rectangle
  else 
    return nil
  end
end


local circle = ShapeFactory.createShape("circle", { radius = 5})
print("Circle area:", circle:area())
print("Circle perimeter: ", circle:perimeter())

local rectangle = ShapeFactory.createShape("rectangle", { width = 4, height = 6})
print("Rectangle area:", rectangle:area())
print("Rectangle perimeter:", rectangle:perimeter())


