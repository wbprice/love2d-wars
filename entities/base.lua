local Base = {}

function Base:new(x, y)
  local base = {}
  setmetatable(base, self) 
  self.__index = self
  base.x = x or 0
  base.y = y or 0
  base.width = 1
  base.height = 1
  return base
end

function Base:draw(posX, posY)
  love.graphics.setColor(0, 0, 255, 255)
  love.graphics.rectangle('fill', posX + 2, posY + 2, 44, 44)
end

function Base:move(posX, posY)
  self.x = posX
  self.y = posY
end

return Base
