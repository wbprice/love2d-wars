local Grid = {}
Grid.__index = Grid

function Grid.new()
  local self = setmetatable({}, Grid)
  self.vCells = 12
  self.hCells = 16
  self.hOffset = 16
  self.vOffset = 12
  return self
end

function Grid:draw()
  love.graphics.setColor(155, 155, 155, 255)
  for i=0,self.vCells do
    love.graphics.line(self.hOffset, i * 48 + self.vOffset, 800 - self.hOffset, i * 48 + self.vOffset)
  end
  for j=0,self.hCells do
    love.graphics.line(j * 48 + self.hOffset, self.vOffset, j * 48 + self.hOffset, 600 - self.hOffset)
  end
end

function Grid:drawEntity(entity)
  
end

return Grid
