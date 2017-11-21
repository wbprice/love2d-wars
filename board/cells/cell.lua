local Cell = {}

function Cell:new(width, height)
  local cell = {}
  setmetatable(cell, self)
  self.__index = self

  return cell
end

function Cell:draw(originX, originY)
  love.graphics.setColor(155, 155, 155, 255)
  love.graphics.rectangle('line', originX, originY, 48, 48)    
end

return Cell
