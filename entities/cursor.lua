local Cursor = {}
Cursor.__index = Cursor

function Cursor.new(x, y)
  local self = setmetatable({}, Cursor)
  self.x = x or 16
  self.y = y or 12
  self.height = 48
  self.width = 48
  return self
end

function Cursor.draw(self)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle('fill', self.x + 2, self.y + 2, self.width - 4, self.height - 4)
end

function Cursor.onMove(self)
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
