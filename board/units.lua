local Grid = require 'board/grid'

local Units = Grid:new()

function drawCell(originX, originY)
  love.graphics.setColor(155, 155, 155, 255)
  love.graphics.rectangle('line', originX, originY, 48, 48)    
end

function Units:draw()
  love.graphics.setColor(155, 155, 155, 255)

  for y, row in pairs(self.cells) do
    for x, cell in pairs(self.cells[y]) do
      local entity = self.cells[y][x]
      if entity.draw then
        local originX = self.hOffset + x * self.tileWidth
        local originY = self.vOffset + y * self.tileHeight
        entity:draw(originX, originY)
      end
    end
  end
end

return Units
