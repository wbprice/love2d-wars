local Base = require('entities/base')

local Cursor = Base:new()

function Cursor:draw(posX, posY)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle('fill', posX, posY, 48, 48)
end

function Cursor:onMove()
  if love.keyboard.isDown('up') then
    if self.y > 16 then
      self.y = self.y - self.height
    end
  end

  if love.keyboard.isDown('down') then
    if self.y < 588 - self.height then
      self.y = self.y + self.height
    end
  end

  if love.keyboard.isDown('left') then
    if self.x > 16 then
      self.x = self.x - self.width
    end
  end

  if love.keyboard.isDown('right') then
    if self.x < 784 - self.width then
      self.x = self.x + self.width
    end
  end
end

return Cursor
