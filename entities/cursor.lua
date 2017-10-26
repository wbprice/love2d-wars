local Base = require('entities/base')

local Cursor = Base:new()

function Cursor:draw(posX, posY)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle('fill', posX, posY, 48, 48)
end

function Cursor:onMove()
  if love.keyboard.isDown('up') then
    if self.y > 0 then
      self.y = self.y - 1
    end
  end

  if love.keyboard.isDown('down') then
    if self.y < 11 then
      self.y = self.y + 1
    end
  end

  if love.keyboard.isDown('left') then
    if self.x > 0 then
      self.x = self.x - 1
    end
  end

  if love.keyboard.isDown('right') then
    if self.x < 15 then
      self.x = self.x + 1
    end
  end
end

return Cursor
